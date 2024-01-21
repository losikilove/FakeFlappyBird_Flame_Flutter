import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flappy_bird/src/components/pillar.dart';
import 'package:flappy_bird/src/config.dart';
import 'package:flappy_bird/src/my_game.dart';

class StackPillar extends PositionComponent with HasGameRef<MyGame> {
  static final Vector2 _velocityPillar = Vector2(gameWidth * 0.25, 0);

  StackPillar({required super.position});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final random = math.Random();

    final topPillarSize = Vector2(
        widthPillar, (random.nextInt(maxHeightPillar) + minHeightPillar) * 1.0);
    final bottomPillarSize =
        Vector2(topPillarSize.x, gameHeight - topPillarSize.y - birdSize.y * 5);

    final topPillar = Pillar(
        size: topPillarSize,
        position: Vector2(position.x, 0),
        velocity: _velocityPillar);
    final bottomPillar = Pillar(
        size: bottomPillarSize,
        position: Vector2(position.x, gameHeight),
        velocity: _velocityPillar,
        isTop: false);

    addAll([topPillar, bottomPillar]);
  }

  double _timeSincePillar = 0;
  final double _pillarInterval = 2; //set time countdowm (seconds)
  @override
  void update(double dt) {
    super.update(dt);

    _timeSincePillar += dt;

    if (_timeSincePillar > _pillarInterval) {
      final random = math.Random();

      final topPillarSize = Vector2(widthPillar,
          (random.nextInt(maxHeightPillar) + minHeightPillar) * 1.0);
      final bottomPillarSize = Vector2(
          topPillarSize.x, gameHeight - topPillarSize.y - birdSize.y * 5);

      final topPillar = Pillar(
          size: topPillarSize,
          position: Vector2(position.x, 0),
          velocity: _velocityPillar);
      final bottomPillar = Pillar(
          size: bottomPillarSize,
          position: Vector2(position.x, gameHeight),
          velocity: _velocityPillar,
          isTop: false);

      addAll([topPillar, bottomPillar]);
      _timeSincePillar = 0;
    }
  }
}
