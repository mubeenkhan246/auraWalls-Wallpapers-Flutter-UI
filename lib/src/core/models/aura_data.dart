import 'package:flutter/material.dart';

import 'wallpaper.dart';

const wallpapers = <Wallpaper>[
  Wallpaper(
    id: 'nebula',
    title: 'Nebula Silk',
    artist: 'Ava Neural',
    imageUrl:
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=1200&q=90',
    palette: [Color(0xFF8B5CF6), Color(0xFF3B82F6), Color(0xFFFAFAFA)],
    collection: 'Space',
    height: 280,
  ),
  Wallpaper(
    id: 'tokyo',
    title: 'Chrome Tokyo',
    artist: 'Kai Vector',
    imageUrl:
        'https://images.unsplash.com/photo-1519608487953-e999c86e7455?auto=format&fit=crop&w=1200&q=90',
    palette: [Color(0xFF3B82F6), Color(0xFF8B5CF6), Color(0xFF18181B)],
    collection: 'Cyberpunk',
    height: 360,
  ),
  Wallpaper(
    id: 'alps',
    title: 'Glacier Air',
    artist: 'Mira Vale',
    imageUrl:
        'https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?auto=format&fit=crop&w=1200&q=90',
    palette: [Color(0xFFFAFAFA), Color(0xFF3B82F6), Color(0xFF09090B)],
    collection: 'Nature',
    height: 300,
  ),
  Wallpaper(
    id: 'minimal',
    title: 'Quiet Form',
    artist: 'Noor Studio',
    imageUrl:
        'https://images.unsplash.com/photo-1557683316-973673baf926?auto=format&fit=crop&w=1200&q=90',
    palette: [Color(0xFF09090B), Color(0xFF18181B), Color(0xFF8B5CF6)],
    collection: 'Minimal',
    height: 250,
  ),
  Wallpaper(
    id: 'car',
    title: 'Vanta GT',
    artist: 'Lux Render',
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=90',
    palette: [Color(0xFF09090B), Color(0xFF3B82F6), Color(0xFFFAFAFA)],
    collection: 'Luxury Cars',
    height: 330,
  ),
  Wallpaper(
    id: 'arch',
    title: 'Glass Atrium',
    artist: 'Zed Lines',
    imageUrl:
        'https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=1200&q=90',
    palette: [Color(0xFF18181B), Color(0xFFFAFAFA), Color(0xFF8B5CF6)],
    collection: 'Architecture',
    height: 290,
  ),
];

const collections = <CollectionTheme>[
  CollectionTheme(
    name: 'Cyberpunk',
    subtitle: 'Neon streets and chrome nights',
    imageUrl:
        'https://images.unsplash.com/photo-1519608487953-e999c86e7455?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
  ),
  CollectionTheme(
    name: 'Minimal',
    subtitle: 'Calm geometry for quiet screens',
    imageUrl:
        'https://images.unsplash.com/photo-1557683316-973673baf926?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF18181B), Color(0xFF8B5CF6)],
  ),
  CollectionTheme(
    name: 'Space',
    subtitle: 'Deep fields and cosmic gradients',
    imageUrl:
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF09090B), Color(0xFF3B82F6)],
  ),
  CollectionTheme(
    name: 'Nature',
    subtitle: 'Premium landscape calm',
    imageUrl:
        'https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF3B82F6), Color(0xFFFAFAFA)],
  ),
  CollectionTheme(
    name: 'Gaming',
    subtitle: 'High contrast digital arenas',
    imageUrl:
        'https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF8B5CF6), Color(0xFF09090B)],
  ),
  CollectionTheme(
    name: 'Luxury Cars',
    subtitle: 'Sculpted speed in low light',
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF09090B), Color(0xFF3B82F6)],
  ),
  CollectionTheme(
    name: 'Architecture',
    subtitle: 'Glass, shadow, and future lines',
    imageUrl:
        'https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=1200&q=90',
    colors: [Color(0xFF18181B), Color(0xFFFAFAFA)],
  ),
];
