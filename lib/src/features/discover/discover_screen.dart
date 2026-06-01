import 'package:flutter/material.dart';

import '../../core/models/aura_data.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass.dart';
import '../../core/widgets/wallpaper_card.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cats = ['Abstract', 'OLED', 'Aura', 'Macro', 'Spatial', 'Neon'];
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.paddingOf(context).top + 20,
        20,
        120,
      ),
      children: [
        Glass(
          radius: 34,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: AuraColors.electricPurple,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  'Describe a feeling',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: cats
              .map(
                (cat) => Chip(
                  label: Text(cat),
                  avatar: const Icon(Icons.blur_on_rounded, size: 16),
                  backgroundColor: Colors.white.withValues(alpha: .10),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 28),
        Text(
          'Smart picks',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 14),
        for (final wallpaper in wallpapers.take(4))
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 280),
              scale: 1,
              child: WallpaperCard(wallpaper: wallpaper, height: 230),
            ),
          ),
      ],
    );
  }
}
