import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/models/aura_data.dart';
import '../core/theme/app_theme.dart';
import '../features/collections/collections_screen.dart';
import '../features/details/wallpaper_details_screen.dart';
import '../features/discover/discover_screen.dart';
import '../features/favorites/favorites_screen.dart';
import '../features/home/home_screen.dart';
import '../features/profile/profile_screen.dart';
import 'aura_shell.dart';

class AuraWallsApp extends StatelessWidget {
  const AuraWallsApp({super.key});

  static final _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AuraShell(child: child),
        routes: [
          GoRoute(path: '/', pageBuilder: _fadePage((_) => const HomeScreen())),
          GoRoute(
            path: '/discover',
            pageBuilder: _fadePage((_) => const DiscoverScreen()),
          ),
          GoRoute(
            path: '/collections',
            pageBuilder: _fadePage((_) => const CollectionsScreen()),
          ),
          GoRoute(
            path: '/favorites',
            pageBuilder: _fadePage((_) => const FavoritesScreen()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: _fadePage((_) => const ProfileScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/wallpaper/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'];
          final wallpaper = wallpapers.firstWhere(
            (item) => item.id == id,
            orElse: () => wallpapers.first,
          );
          return CustomTransitionPage(
            child: WallpaperDetailsScreen(wallpaper: wallpaper),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                      child: child,
                    ),
          );
        },
      ),
    ],
  );

  static Page<dynamic> Function(BuildContext, GoRouterState) _fadePage(
    WidgetBuilder builder,
  ) {
    return (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ),
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0, .015),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AuraWalls',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: _router,
    );
  }
}
