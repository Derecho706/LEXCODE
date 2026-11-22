import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/question.dart';
import '../../models/unit.dart';
import '../../core/mascot_assets.dart';
import '../../core/theme.dart';
import '../../providers/game_provider.dart';
import '../../widgets/mascot_state.dart';
import '../../widgets/progress_bar.dart';
import '../../widgets/option_button.dart';
import '../victory/victory_screen.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final List<Question> preguntas;
  final bool esExamenUnidad;
  final bool esExamenFinal;
  final String id;
  final Lesson? lesson;
  final Unit? unit;

  const QuizScreen({
    super.key,
    required this.preguntas,
    required this.esExamenUnidad,
    required this.id,
    this.esExamenFinal = false,
    this.lesson,
    this.unit,
  });

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int _index = 0;
  int _correctas = 0;
  int? _seleccion;
  bool _respondido = false;

  void _comprobar() {
    final q = widget.preguntas[_index];
    if (_seleccion == q.correct) _correctas++;
    setState(() => _respondido = true);
  }

  Widget? _reintento() {
    if (!widget.esExamenUnidad &&
        !widget.esExamenFinal &&
        widget.lesson == null) {
      return null;
    }
    return QuizScreen(
      preguntas: widget.preguntas,
      esExamenUnidad: widget.esExamenUnidad,
      esExamenFinal: widget.esExamenFinal,
      id: widget.id,
      lesson: widget.lesson,
      unit: widget.unit,
    );
  }

  void _siguiente() {
    if (_index + 1 < widget.preguntas.length) {
      setState(() {
        _index++;
        _seleccion = null;
        _respondido = false;
      });
      return;
    }

    final total = widget.preguntas.length;
    final notifier = ref.read(gameProvider.notifier);
    var aprobado = true;
    var mostrarReconocimiento = false;

    if (widget.esExamenFinal) {
      aprobado = notifier.aprobado(_correctas, total);
      notifier.responderExamenFinal(_correctas, total);
      mostrarReconocimiento = ref.read(gameProvider).reconocimientoFinal;
    } else if (widget.esExamenUnidad) {
      aprobado = notifier.aprobado(_correctas, total);
      notifier.responderQuizUnidad(widget.id, _correctas, total);
    } else {
      aprobado = notifier.aprobado(_correctas, total);
      notifier.responderQuizLeccion(widget.id, _correctas, total);
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => VictoryScreen(
          esExamenUnidad: widget.esExamenUnidad,
          esExamenFinal: widget.esExamenFinal,
          aprobado: aprobado,
          correctas: _correctas,
          total: total,
          unit: widget.unit,
          mostrarReconocimiento: mostrarReconocimiento,
          reintento: aprobado ? null : _reintento(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.preguntas.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('Este quiz aún no tiene preguntas.')),
      );
    }
    final q = widget.preguntas[_index];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Pregunta ${_index + 1}/${widget.preguntas.length}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProgressBar(actual: _index, total: widget.preguntas.length),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    MascotState(
                      estado: _respondido
                          ? (_seleccion == q.correct
                              ? MascotEstado.correcto
                              : MascotEstado.incorrecto)
                          : MascotEstado.quiz,
                      size: 96,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      q.q,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      q.options.length,
                      (i) => OptionButton(
                        texto: q.options[i],
                        seleccionada: _seleccion == i,
                        correcta: _respondido && i == q.correct,
                        incorrecta:
                            _respondido && _seleccion == i && i != q.correct,
                        onTap: _respondido
                            ? () {}
                            : () => setState(() => _seleccion = i),
                      ),
                    ),
                    if (_respondido) ...[
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                q.exp,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: colorText,
                                ),
                              ),
                              if (q.fuente != null) ...[
                                const SizedBox(height: 8),
                                Text(
                                  'Fuente: ${q.fuente}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: colorMuted,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _respondido
                      ? _siguiente
                      : (_seleccion == null ? null : _comprobar),
                  child: Text(_respondido ? 'CONTINUAR' : 'COMPROBAR'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
