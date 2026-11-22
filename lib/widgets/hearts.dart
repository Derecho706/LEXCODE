import 'package:material_ui/material_ui.dart';
import '../core/theme.dart';

class Hearts extends StatelessWidget {
  final int vidas;
  const Hearts({super.key, required this.vidas});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (i) => Icon(
          Icons.favorite,
          color: i < vidas
              ? colorDanger
              : colorBorder.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}
