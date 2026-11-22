import 'package:material_ui/material_ui.dart';
import '../../core/mascot_assets.dart';
import '../../core/theme.dart';
import '../../models/unit.dart';
import '../../widgets/mascot_state.dart';
import '../lessons/lessons_screen.dart';
import '../recognition/recognition_screen.dart';
import '../units/units_screen.dart';

class VictoryScreen extends StatelessWidget {
  final bool esExamenUnidad;
  final bool esExamenFinal;
  final bool aprobado;
  final int correctas;
  final int total;
  final bool mostrarReconocimiento;
  final Unit? unit;
  final Widget? reintento;

  const VictoryScreen({
    super.key,
    required this.esExamenUnidad,
    required this.aprobado,
    required this.correctas,
    required this.total,
    this.esExamenFinal = false,
    this.mostrarReconocimiento = false,
    this.unit,
    this.reintento,
  });

  String get _titulo {
    if (!aprobado) {
      if (esExamenFinal) return 'No aprobaste el quiz final, reconsidera';
      if (esExamenUnidad) return 'No aprobaste la unidad, reconsidera';
      return 'Lección no pasada, repite el quiz';
    }
    if (esExamenFinal) return '¡Quiz final aprobado!';
    if (esExamenUnidad) return '¡Unidad completada!';
    return '¡Lección completada!';
  }

  Widget _destino() {
    if (mostrarReconocimiento) return const RecognitionScreen();
    if (unit != null) return LessonsScreen(unit: unit!);
    return const UnitsScreen();
  }

  void _irA(BuildContext context, Widget destino) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => destino),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final volverALaUnidad = unit != null && !esExamenFinal;
    final volver = volverALaUnidad
        ? LessonsScreen(unit: unit!)
        : const UnitsScreen();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MascotState(
                  estado: aprobado ? MascotEstado.logro : MascotEstado.incorrecto,
                  size: 160,
                ),
                const SizedBox(height: 20),
                Text(
                  _titulo,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: aprobado ? colorSuccess : colorText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Respuestas correctas: $correctas/$total',
                  style: const TextStyle(color: colorText),
                ),
                const SizedBox(height: 24),
                if (reintento != null) ...[
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => reintento!),
                      ),
                      child: Text(
                        !esExamenUnidad && !esExamenFinal
                            ? 'REINTENTAR QUIZ'
                            : 'REINTENTAR',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => _irA(context, volver),
                    child: Text(
                      volverALaUnidad
                          ? 'VOLVER A LA UNIDAD'
                          : 'VOLVER AL TEMARIO',
                    ),
                  ),
                ] else
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => _irA(context, _destino()),
                      child: const Text('CONTINUAR'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
