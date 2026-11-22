import 'package:material_ui/material_ui.dart';
import 'core/theme.dart';
import 'features/landing/landing_screen.dart';

class LexcodeApp extends StatelessWidget {
  const LexcodeApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'LexCode',
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    home: const LandingScreen(),
  );
}