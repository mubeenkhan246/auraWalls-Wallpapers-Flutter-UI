import 'package:flutter/material.dart';

import '../../core/models/aura_data.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass.dart';
import '../../core/widgets/wallpaper_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final saved = wallpapers.take(4).toList();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.paddingOf(context).top + 20,
            20,
            20,
          ),
          sliver: SliverList.list(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'Saved',
                      value: '${saved.length}',
                      icon: Icons.favorite_rounded,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: _StatCard(
                      label: 'Downloads',
                      value: '128',
                      icon: Icons.file_download_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Text(
                'Your gallery',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      for (var i = 0; i < saved.length; i += 2) ...[
                        WallpaperCard(wallpaper: saved[i]),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      for (var i = 1; i < saved.length; i += 2) ...[
                        WallpaperCard(wallpaper: saved[i]),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Glass(
      radius: 28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AuraColors.electricPurple),
          const SizedBox(height: 18),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          Text(label, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }
}
