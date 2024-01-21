import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/src/my_game.dart';
import 'package:flutter/material.dart';

class Bird extends RectangleComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  final Vector2 velocity;

  Bird({
    required this.velocity,
    required super.position,
    required Vector2 size,
  }) : super(
            size: size,
            anchor: Anchor.center,
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [RectangleHitbox()]);

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    gameRef.gameOver();
  }

  void fly() {
    final effect = MoveByEffect(Vector2(0, -400),
        EffectController(duration: 0.5, curve: Curves.decelerate));

    add(effect);
  }
}
