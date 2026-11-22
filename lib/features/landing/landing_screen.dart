import 'package:material_ui/material_ui.dart';
import '../../core/theme.dart';
import '../../core/mascot_assets.dart';
import '../../widgets/mascot_state.dart';
import '../units/units_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MascotState(estado: MascotEstado.inicio, size: 200),
            const SizedBox(height: 24),
            Text(
              'LEXCODE',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: colorSecondary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'La academia interactiva de Derecho Informático',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const UnitsScreen()),
              ),
              child: const Text('COMENZAR'),
            ),
          ],
        ),
      ),
    );
  }
}
