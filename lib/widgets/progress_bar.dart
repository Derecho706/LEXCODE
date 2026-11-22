import 'package:material_ui/material_ui.dart';

class ProgressBar extends StatelessWidget {
  final int actual;
  final int total;
  const ProgressBar({super.key, required this.actual, required this.total});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: total == 0 ? 0 : actual / total);
  }
}
