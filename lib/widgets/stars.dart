import 'package:material_ui/material_ui.dart';
import '../core/theme.dart';

class Stars extends StatelessWidget {
  final int total;
  const Stars({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: colorText),
        const SizedBox(width: 4),
        Text('$total', style: const TextStyle(color: colorText)),
      ],
    );
  }
}
