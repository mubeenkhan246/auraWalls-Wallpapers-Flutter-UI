import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/wallpaper.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass.dart';

class WallpaperDetailsScreen extends StatefulWidget {
  const WallpaperDetailsScreen({super.key, required this.wallpaper});

  final Wallpaper wallpaper;

  @override
  State<WallpaperDetailsScreen> createState() => _WallpaperDetailsScreenState();
}

class _WallpaperDetailsScreenState extends State<WallpaperDetailsScreen> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final wallpaper = widget.wallpaper;

    return Scaffold(
      backgroundColor: AuraColors.deepBlack,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: wallpaper.id,
            child: Image.network(wallpaper.imageUrl, fit: BoxFit.cover),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, .62, 1],
                colors: [
                  Colors.black.withValues(alpha: .18),
                  Colors.transparent,
                  Colors.black.withValues(alpha: .38),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 12,
            left: 18,
            right: 18,
            child: Row(
              children: [
                _CircleAction(
                  icon: Icons.arrow_back_rounded,
                  onTap: () =>
                      context.canPop() ? context.pop() : context.go('/'),
                ),
                const Spacer(),
                _CircleAction(
                  icon: favorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  onTap: () => setState(() => favorite = !favorite),
                  active: favorite,
                ),
                const SizedBox(width: 10),
                _CircleAction(icon: Icons.ios_share_rounded, onTap: () {}),
              ],
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: MediaQuery.paddingOf(context).bottom + 16,
            child: _ActionDock(wallpaper: wallpaper),
          ),
        ],
      ),
    );
  }
}

class _ActionDock extends StatelessWidget {
  const _ActionDock({required this.wallpaper});

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AuraColors.deepBlack.withValues(alpha: .34),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withValues(alpha: .16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .36),
                blurRadius: 30,
                offset: const Offset(0, 16),
              ),
              BoxShadow(
                color: wallpaper.palette.first.withValues(alpha: .16),
                blurRadius: 24,
                spreadRadius: -10,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: _PrimaryAction(
                  icon: Icons.file_download_rounded,
                  label: 'Download',
                  colors: const [
                    AuraColors.electricPurple,
                    AuraColors.neonBlue,
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const _SecondaryAction(
                icon: Icons.wallpaper_rounded,
                label: 'Set As',
              ),
              const SizedBox(width: 10),
              const _SecondaryAction(icon: Icons.tune_rounded, label: 'Edit'),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryAction extends StatelessWidget {
  const _PrimaryAction({
    required this.icon,
    required this.label,
    required this.colors,
  });

  final IconData icon;
  final String label;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(colors: colors),
        boxShadow: [
          BoxShadow(
            color: AuraColors.neonBlue.withValues(alpha: .28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 9),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecondaryAction extends StatelessWidget {
  const _SecondaryAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: .14)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(height: 3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({
    required this.icon,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Glass(
        radius: 24,
        padding: const EdgeInsets.all(13),
        opacity: active ? .24 : .12,
        child: Icon(
          icon,
          color: active ? AuraColors.electricPurple : Colors.white,
        ),
      ),
    );
  }
}
