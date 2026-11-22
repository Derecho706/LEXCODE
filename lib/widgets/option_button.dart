import 'package:material_ui/material_ui.dart';
import '../../core/theme.dart';

class OptionButton extends StatelessWidget {
  final String texto;
  final bool seleccionada;
  final bool correcta;
  final bool incorrecta;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.texto,
    required this.onTap,
    this.seleccionada = false,
    this.correcta = false,
    this.incorrecta = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(texto),
      selected: seleccionada,
      selectedColor: colorText,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: correcta
              ? colorSuccess
              : incorrecta
                  ? colorDanger
                  : seleccionada
                      ? colorSecondary
                      : colorBorder.withValues(alpha: 0.55),
          width: seleccionada || correcta || incorrecta ? 2 : 1,
        ),
      ),
    );
  }
}
