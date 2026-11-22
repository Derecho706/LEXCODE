import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/mascot_assets.dart';
import '../../providers/game_provider.dart';
import '../../widgets/mascot_state.dart';
import '../../widgets/stars.dart';
import '../units/units_screen.dart';

class RecognitionScreen extends ConsumerWidget {
  const RecognitionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MascotState(estado: MascotEstado.finalizado, size: 180),
                const SizedBox(height: 20),
                const Text(
                  '¡Completaste todas las unidades y el quiz final!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Stars(total: state.stars),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const UnitsScreen()),
                      (_) => false,
                    ),
                    child: const Text('VOLVER AL TEMARIO'),
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
