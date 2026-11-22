import 'package:material_ui/material_ui.dart';
import '../core/mascot_assets.dart';

class MascotState extends StatelessWidget {
  final MascotEstado estado;
  final double size;
  const MascotState({super.key, required this.estado, this.size = 160});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
      child: Image.asset(
        mascotAssets[estado]!,
        key: ValueKey(estado),
        width: size,
        fit: BoxFit.contain,
      ),
    );
  }
}