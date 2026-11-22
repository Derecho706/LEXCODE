import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/curriculum.dart';
import '../../data/final_exam.dart';
import '../../providers/game_provider.dart';
import '../../widgets/hearts.dart';
import '../../widgets/stars.dart';
import '../../widgets/unit_path.dart';
import '../lessons/lessons_screen.dart';
import '../quiz/quiz_screen.dart';
import '../recognition/recognition_screen.dart';

class UnitsScreen extends ConsumerWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    final todasCompletas =
        curriculum.every((u) => state.completedUnits.contains(u.id));

    Future<void> confirmarReinicio() async {
      final confirmar = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Reiniciar progreso'),
          content: const Text('¿Borrar vidas, estrellas y unidades completadas?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('CANCELAR'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('REINICIAR'),
            ),
          ],
        ),
      );
      if (confirmar == true) {
        ref.read(gameProvider.notifier).reiniciarProgreso();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Temario Completo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Hearts(vidas: state.hearts),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stars(total: state.stars),
          ),
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed: confirmarReinicio,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: UnitPath(
                units: curriculum,
                completedUnits: state.completedUnits,
                onTap: (unit) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LessonsScreen(unit: unit),
                  ),
                ),
              ),
            ),
            if (todasCompletas)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(
                          preguntas: finalExam,
                          esExamenUnidad: false,
                          esExamenFinal: true,
                          id: 'final',
                        ),
                      ),
                    ),
                    child: const Text('QUIZ FINAL (70 PREGUNTAS)'),
                  ),
                ),
              ),
            if (state.reconocimientoFinal)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RecognitionScreen(),
                      ),
                    ),
                    child: const Text('VER RECONOCIMIENTO FINAL'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
