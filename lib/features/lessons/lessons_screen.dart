import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme.dart';
import '../../models/unit.dart';
import '../../providers/game_provider.dart';
import '../quiz/quiz_screen.dart';
import '../theory/theory_screen.dart';

class LessonsScreen extends ConsumerWidget {
  final Unit unit;
  const LessonsScreen({super.key, required this.unit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    final allDone = unit.lessons.every(
      (l) => state.completedLessons.contains(l.id),
    );
    final examDone = state.completedUnits.contains(unit.id);

    return Scaffold(
      appBar: AppBar(title: Text(unit.title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Lecciones de la unidad',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorText,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 20,
                children: List.generate(unit.lessons.length, (i) {
                  final lesson = unit.lessons[i];
                  final done = state.completedLessons.contains(lesson.id);
                  final failed = state.failedLessons.contains(lesson.id);
                  final unlocked = i == 0 ||
                      state.completedLessons.contains(unit.lessons[i - 1].id);

                  return _LessonNode(
                    index: i + 1,
                    label: lesson.title,
                    status: done
                        ? 'PASADA'
                        : failed
                            ? 'NO PASADO'
                            : unlocked
                                ? 'DISPONIBLE'
                                : 'BLOQUEADA',
                    done: done,
                    failed: failed,
                    unlocked: unlocked,
                    onTap: !unlocked
                        ? null
                        : () {
                            if (failed) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => QuizScreen(
                                    preguntas: lesson.questions,
                                    esExamenUnidad: false,
                                    id: lesson.id,
                                    lesson: lesson,
                                    unit: unit,
                                  ),
                                ),
                              );
                              return;
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => TheoryScreen(
                                  lesson: lesson,
                                  unit: unit,
                                ),
                              ),
                            );
                          },
                  );
                }),
              ),
              const SizedBox(height: 30),
              _LessonNode(
                index: unit.lessons.length + 1,
                label: 'Examen de unidad',
                status: examDone
                    ? 'APROBADO'
                    : allDone
                        ? 'DISPONIBLE'
                        : 'BLOQUEADO',
                done: examDone,
                failed: false,
                unlocked: allDone,
                onTap: !allDone
                    ? null
                    : () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => QuizScreen(
                              preguntas: unit.exam,
                              esExamenUnidad: true,
                              id: unit.id,
                              unit: unit,
                            ),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonNode extends StatelessWidget {
  final int index;
  final String label;
  final String status;
  final bool done;
  final bool failed;
  final bool unlocked;
  final VoidCallback? onTap;

  const _LessonNode({
    required this.index,
    required this.label,
    required this.status,
    required this.done,
    required this.failed,
    required this.unlocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = !unlocked
        ? colorSurface
        : failed
            ? colorText
            : done
                ? colorSuccess
                : colorSecondary;
    final icon = !unlocked
        ? Icons.lock
        : failed
            ? Icons.replay
            : done
                ? Icons.check
                : Icons.play_arrow;
    final iconColor = failed ? colorBackground : colorText;

    return SizedBox(
      width: 112,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(40),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: failed || done ? colorText : colorBorder,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorBorder.withValues(alpha: 0.22),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      index.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: colorBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: colorBorder, width: 2),
                        ),
                        child: Icon(icon, size: 14, color: iconColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: unlocked ? colorText : colorMuted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            status,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: failed ? colorText : colorMuted,
            ),
          ),
        ],
      ),
    );
  }
}
