import 'package:flutter/material.dart';

import '../../core/models/aura_data.dart';
import '../../core/models/wallpaper.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass.dart';
import '../../core/widgets/wallpaper_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.paddingOf(context).top + 16,
            20,
            20,
          ),
          sliver: SliverList.list(
            children: [
              const _SearchPill(),
              const SizedBox(height: 28),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) => Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 18 * (1 - value)),
                    child: child,
                  ),
                ),
                child: Text(
                  'Curated for your aura',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              WallpaperCard(wallpaper: wallpapers.first, height: 430),
              const SizedBox(height: 28),
              _SectionHeader(title: 'AI collections', action: 'Live curation'),
              const SizedBox(height: 14),
              SizedBox(
                height: 126,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => _CollectionCapsule(
                    name: collections[index].name,
                    colors: collections[index].colors,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemCount: collections.length,
                ),
              ),
              const SizedBox(height: 28),
              _SectionHeader(title: 'Trending now', action: 'Gallery'),
              const SizedBox(height: 14),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
            child: _MasonryWall(wallpapers: wallpapers),
          ),
        ),
      ],
    );
  }
}

class _MasonryWall extends StatelessWidget {
  const _MasonryWall({required this.wallpapers});

  final List<Wallpaper> wallpapers;

  @override
  Widget build(BuildContext context) {
    final columnCount = MediaQuery.sizeOf(context).width > 700 ? 3 : 2;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(columnCount, (column) {
        final items = [
          for (var i = column; i < wallpapers.length; i += columnCount)
            wallpapers[i],
        ];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: column == 0 ? 0 : 8,
              right: column == columnCount - 1 ? 0 : 8,
            ),
            child: Column(
              children: [
                for (final wallpaper in items) ...[
                  WallpaperCard(wallpaper: wallpaper, enableHero: false),
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _SearchPill extends StatelessWidget {
  const _SearchPill();

  @override
  Widget build(BuildContext context) {
    return Glass(
      radius: 28,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: Colors.white70),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Search cinematic walls',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
          ),
          const Icon(Icons.tune_rounded, color: AuraColors.neonBlue),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        Text(
          action,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AuraColors.neonBlue),
        ),
      ],
    );
  }
}

class _CollectionCapsule extends StatelessWidget {
  const _CollectionCapsule({required this.name, required this.colors});

  final String name;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: .28),
            blurRadius: 24,
            spreadRadius: -8,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colors.first.withValues(alpha: .90),
                      AuraColors.graphite.withValues(alpha: .88),
                      colors.last.withValues(alpha: .62),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -22,
              top: -20,
              child: Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: .10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .16),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Row(
                children: colors.take(2).map((color) {
                  return Container(
                    width: 12,
                    height: 12,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_outward_rounded, size: 18),
                ],
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
