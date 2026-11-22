import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

const colorPrimary = Color(0xFF003153);
const colorSecondary = Color(0xFF1F4E79);
const colorBackground = Color(0xFF0B1F3A);
const colorSurface = Color(0xFF003153);
const colorMuted = Color(0xFF8FA6B8);
const colorText = Color(0xFFF2EFE9);
const colorSuccess = Color(0xFF8FA6B8);
const colorDanger = Color(0xFFF2EFE9);
const colorWarning = Color(0xFF8FA6B8);
const colorBorder = Color(0xFF8FA6B8);

ThemeData buildTheme() {
  final base = ThemeData(brightness: Brightness.dark);
  final scheme = ColorScheme.fromSeed(
    seedColor: colorPrimary,
    brightness: Brightness.dark,
  ).copyWith(
    primary: colorPrimary,
    onPrimary: colorText,
    secondary: colorSecondary,
    onSecondary: colorText,
    surface: colorSurface,
    onSurface: colorText,
    error: colorDanger,
    onError: colorBackground,
    outline: colorBorder,
  );

  return base.copyWith(
    scaffoldBackgroundColor: colorBackground,
    colorScheme: scheme,
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: colorText,
      displayColor: colorText,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: colorBackground,
      foregroundColor: colorText,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: colorText),
    cardTheme: CardThemeData(
      color: colorSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorBorder.withValues(alpha: 0.45)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorSecondary,
        foregroundColor: colorText,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorText,
        side: const BorderSide(color: colorBorder),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colorMuted),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: colorSecondary,
      linearTrackColor: colorSurface,
    ),
    dividerTheme: DividerThemeData(color: colorBorder.withValues(alpha: 0.4)),
  );
}
