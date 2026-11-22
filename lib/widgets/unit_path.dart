import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import '../../core/theme.dart';
import '../../models/unit.dart';

class UnitPath extends StatelessWidget {
  final List<Unit> units;
  final Set<String> completedUnits;
  final void Function(Unit unit) onTap;

  const UnitPath({
    super.key,
    required this.units,
    required this.completedUnits,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const nodeSize = 82.0;
        const spacing = 126.0;
        const top = 22.0;
        final width = constraints.maxWidth;
        final left = width * 0.25;
        final right = width * 0.75;
        final height = top + spacing * (units.length - 1) + nodeSize + 70;
        final centers = List<Offset>.generate(
          units.length,
          (i) => Offset(
            i.isEven ? left : right,
            top + i * spacing + nodeSize / 2,
          ),
        );

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _PathPainter(
                      centers: centers,
                      color: colorBorder.withValues(alpha: 0.55),
                    ),
                  ),
                ),
                ...List.generate(units.length, (i) {
                  final unit = units[i];
                  final unlocked =
                      i == 0 || completedUnits.contains(units[i - 1].id);
                  final done = completedUnits.contains(unit.id);
                  final center = centers[i];
                  return Positioned(
                    left: center.dx - nodeSize / 2,
                    top: center.dy - nodeSize / 2,
                    child: _UnitNode(
                      unit: unit,
                      size: nodeSize,
                      unlocked: unlocked,
                      done: done,
                      onTap: unlocked ? () => onTap(unit) : null,
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _UnitNode extends StatelessWidget {
  final Unit unit;
  final double size;
  final bool unlocked;
  final bool done;
  final VoidCallback? onTap;

  const _UnitNode({
    required this.unit,
    required this.size,
    required this.unlocked,
    required this.done,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = !unlocked
        ? colorSurface
        : done
            ? colorSuccess
            : colorSecondary;
    final icon = !unlocked
        ? Icons.lock
        : done
            ? Icons.check
            : Icons.play_arrow;

    return SizedBox(
      width: size + 52,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(size / 2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: done ? colorText : colorBorder,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorBorder.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: unlocked ? 1 : 0.5,
                      child: Text(
                        unit.icon,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: colorBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: colorBorder, width: 2),
                        ),
                        child: Icon(
                          icon,
                          size: 16,
                          color: unlocked ? colorText : colorMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            unit.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: unlocked ? colorText : colorMuted,
              fontWeight: done ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PathPainter extends CustomPainter {
  final List<Offset> centers;
  final Color color;

  const _PathPainter({required this.centers, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < centers.length - 1; i++) {
      _drawDashedLine(canvas, centers[i], centers[i + 1], paint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset from, Offset to, Paint paint) {
    final dx = to.dx - from.dx;
    final dy = to.dy - from.dy;
    final distance = math.sqrt(dx * dx + dy * dy);
    if (distance == 0) return;

    final ux = dx / distance;
    final uy = dy / distance;
    var traveled = 0.0;
    while (traveled < distance) {
      final end = math.min(traveled + 12.0, distance);
      canvas.drawLine(
        Offset(from.dx + ux * traveled, from.dy + uy * traveled),
        Offset(from.dx + ux * end, from.dy + uy * end),
        paint,
      );
      traveled += 20.0;
    }
  }

  @override
  bool shouldRepaint(covariant _PathPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.centers != centers;
}
