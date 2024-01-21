import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/src/my_game.dart';
import 'package:flutter/material.dart';

class Pillar extends RectangleComponent with HasGameReference<MyGame> {
  final Vector2 velocity;

  Pillar({
    required Vector2 size,
    required super.position,
    required this.velocity,
    bool isTop = true,
  }) : super(
          size: size,
          anchor: isTop ? Anchor.topCenter : Anchor.bottomCenter,
          paint: Paint()
            ..color = const Color.fromARGB(255, 145, 30, 30)
            ..style = PaintingStyle.fill,
          children: [
            RectangleHitbox()..collisionType = CollisionType.passive,
          ],
        );

  @override
  void update(double dt) {
    super.update(dt);
    position -= velocity * dt;

    if (position.x < -500) {
      final effect = RemoveEffect(delay: 0.0);
      add(effect);
    }
  }
}
