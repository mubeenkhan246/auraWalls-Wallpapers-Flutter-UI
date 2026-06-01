import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AuraBackground extends StatefulWidget {
  const AuraBackground({super.key, required this.child});

  final Widget child;

  @override
  State<AuraBackground> createState() => _AuraBackgroundState();
}

class _AuraBackgroundState extends State<AuraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: MeshGradientPainter(_controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class MeshGradientPainter extends CustomPainter {
  const MeshGradientPainter(this.t);

  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = AuraColors.deepBlack);
    final points = [
      Offset(
        size.width * (.2 + .05 * math.sin(t * math.pi * 2)),
        size.height * .12,
      ),
      Offset(
        size.width * .9,
        size.height * (.22 + .05 * math.cos(t * math.pi * 2)),
      ),
      Offset(
        size.width * (.15 + .08 * math.cos(t * math.pi * 2)),
        size.height * .72,
      ),
      Offset(size.width * .75, size.height * .86),
    ];
    final colors = [
      AuraColors.electricPurple.withValues(alpha: .35),
      AuraColors.neonBlue.withValues(alpha: .28),
      AuraColors.graphite.withValues(alpha: .95),
      AuraColors.electricPurple.withValues(alpha: .18),
    ];
    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(
        points[i],
        size.shortestSide * .55,
        Paint()
          ..shader = RadialGradient(colors: [colors[i], Colors.transparent])
              .createShader(
                Rect.fromCircle(
                  center: points[i],
                  radius: size.shortestSide * .55,
                ),
              ),
      );
    }
    canvas.saveLayer(
      Offset.zero & size,
      Paint()..imageFilter = ImageFilter.blur(sigmaX: 36, sigmaY: 36),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant MeshGradientPainter oldDelegate) =>
      oldDelegate.t != t;
}
