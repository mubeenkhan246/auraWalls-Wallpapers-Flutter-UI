import 'package:flutter/material.dart';

class Wallpaper {
  const Wallpaper({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.palette,
    required this.collection,
    required this.height,
  });

  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final List<Color> palette;
  final String collection;
  final double height;
}

class CollectionTheme {
  const CollectionTheme({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.colors,
  });

  final String name;
  final String subtitle;
  final String imageUrl;
  final List<Color> colors;
}
