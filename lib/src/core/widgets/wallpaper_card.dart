import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/wallpaper.dart';
import '../theme/app_theme.dart';

class WallpaperCard extends StatelessWidget {
  const WallpaperCard({
    super.key,
    required this.wallpaper,
    this.height,
    this.compact = false,
    this.enableHero = true,
  });

  final Wallpaper wallpaper;
  final double? height;
  final bool compact;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    final cardHeight = height ?? wallpaper.height;
    final radius = compact ? 26.0 : 32.0;

    final card = Material(
      color: Colors.transparent,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: .96, end: 1),
        duration: const Duration(milliseconds: 520),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) =>
            Transform.scale(scale: scale, child: child),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: () => context.go('/wallpaper/${wallpaper.id}'),
          child: Container(
            height: cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                  color: wallpaper.palette.first.withValues(alpha: .34),
                  blurRadius: 34,
                  spreadRadius: -10,
                  offset: const Offset(0, 24),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: .62),
                  blurRadius: 38,
                  spreadRadius: -18,
                  offset: const Offset(0, 30),
                ),
                BoxShadow(
                  color: Colors.white.withValues(alpha: .08),
                  blurRadius: 18,
                  spreadRadius: -12,
                  offset: const Offset(-8, -8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    wallpaper.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              wallpaper.palette.first.withValues(alpha: .55),
                              AuraColors.graphite,
                              wallpaper.palette.last.withValues(alpha: .28),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, .44, 1],
                        colors: [
                          Colors.white.withValues(alpha: .08),
                          Colors.transparent,
                          Colors.black.withValues(alpha: .82),
                        ],
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: .20),
                          Colors.transparent,
                          wallpaper.palette.first.withValues(alpha: .20),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: compact ? 12 : 16,
                    right: compact ? 12 : 16,
                    child: _FloatingActionRail(compact: compact),
                  ),
                  Positioned(
                    left: compact ? 12 : 16,
                    top: compact ? 12 : 16,
                    child: _PaletteBeads(colors: wallpaper.palette),
                  ),
                  Positioned(
                    left: compact ? 12 : 16,
                    right: compact ? 12 : 16,
                    bottom: compact ? 12 : 16,
                    child: _MetadataPlate(
                      wallpaper: wallpaper,
                      compact: compact,
                    ),
                  ),
                  IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: .22),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _CardSheenPainter(
                        color: wallpaper.palette.first,
                        radius: radius,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (!enableHero) {
      return card;
    }

    return Hero(tag: wallpaper.id, child: card);
  }
}

class _MetadataPlate extends StatelessWidget {
  const _MetadataPlate({required this.wallpaper, required this.compact});

  final Wallpaper wallpaper;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(compact ? 20 : 24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.all(compact ? 12 : 14),
          decoration: BoxDecoration(
            color: AuraColors.deepBlack.withValues(alpha: .36),
            borderRadius: BorderRadius.circular(compact ? 20 : 24),
            border: Border.all(color: Colors.white.withValues(alpha: .16)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      wallpaper.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: compact ? 14 : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome_rounded,
                          size: 13,
                          color: AuraColors.neonBlue,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            wallpaper.collection,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!compact) ...[
                const SizedBox(width: 10),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        wallpaper.palette.first,
                        wallpaper.palette.length > 1
                            ? wallpaper.palette[1]
                            : AuraColors.neonBlue,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: wallpaper.palette.first.withValues(alpha: .34),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_outward_rounded, size: 18),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingActionRail extends StatelessWidget {
  const _FloatingActionRail({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 7 : 8,
            vertical: compact ? 6 : 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: .18)),
          ),
          child: Icon(
            Icons.favorite_border_rounded,
            color: Colors.white.withValues(alpha: .88),
            size: compact ? 16 : 18,
          ),
        ),
      ),
    );
  }
}

class _PaletteBeads extends StatelessWidget {
  const _PaletteBeads({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.take(3).map((color) {
        return Container(
          width: 14,
          height: 14,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: .55)),
            boxShadow: [
              BoxShadow(color: color.withValues(alpha: .45), blurRadius: 12),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _CardSheenPainter extends CustomPainter {
  const _CardSheenPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.clipRRect(rrect);

    final sheen = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: .18),
          Colors.white.withValues(alpha: .02),
          Colors.transparent,
        ],
        stops: const [0, .16, .34],
      ).createShader(rect);
    canvas.drawRect(rect, sheen);

    final accent = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: .45),
          color.withValues(alpha: .25),
          Colors.transparent,
        ],
      ).createShader(rect);
    canvas.drawRRect(rrect.deflate(.7), accent);
  }

  @override
  bool shouldRepaint(covariant _CardSheenPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
