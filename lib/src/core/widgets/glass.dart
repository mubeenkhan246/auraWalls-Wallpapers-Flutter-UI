import 'dart:ui';

import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  const Glass({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 28,
    this.opacity = .12,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Colors.white.withValues(alpha: .18)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .42),
                blurRadius: 32,
                offset: const Offset(0, 18),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: .06),
                blurRadius: 18,
                offset: const Offset(-6, -6),
              ),
            ],
          ),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
