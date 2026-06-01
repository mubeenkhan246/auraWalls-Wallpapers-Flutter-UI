import 'package:flutter_test/flutter_test.dart';
import 'package:wallpapers_app/src/app/aura_walls_app.dart';

void main() {
  test('AuraWalls app widget is constructable', () {
    const app = AuraWallsApp();
    expect(app, isA<AuraWallsApp>());
  });
}
