import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import '../core/widgets/aura_background.dart';
import '../core/widgets/glass.dart';

class AuraShell extends StatelessWidget {
  const AuraShell({super.key, required this.child});

  final Widget child;

  static const _items = [
    _NavItem('/', Icons.auto_awesome_rounded, 'Home'),
    _NavItem('/discover', Icons.travel_explore_rounded, 'Discover'),
    _NavItem('/collections', Icons.view_carousel_rounded, 'Collections'),
    _NavItem('/favorites', Icons.favorite_rounded, 'Favorites'),
    _NavItem('/profile', Icons.person_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return Scaffold(
      extendBody: true,
      body: AuraBackground(child: child),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
          child: Glass(
            radius: 30,
            opacity: .10,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _items.map((item) {
                final selected = location == item.path;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 360),
                  curve: Curves.easeOutBack,
                  width: selected ? 110 : 46,
                  height: 52,
                  decoration: BoxDecoration(
                    color: selected
                        ? AuraColors.electricPurple.withValues(alpha: .22)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AuraColors.electricPurple.withValues(
                          alpha: selected ? .35 : 0,
                        ),
                        blurRadius: selected ? 24 : 0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () => context.go(item.path),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon,
                          color: selected ? Colors.white : Colors.white60,
                          size: selected ? 23 : 21,
                        ),
                        ClipRect(
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 240),
                            child: selected
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        item.label,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.path, this.icon, this.label);

  final String path;
  final IconData icon;
  final String label;
}
