import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app/aura_walls_app.dart';

void main() {
  runApp(const ProviderScope(child: AuraWallsApp()));
}
