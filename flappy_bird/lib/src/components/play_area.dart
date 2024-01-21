import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/src/config.dart';
import 'package:flutter/material.dart';

import '../my_game.dart';

class PlayArea extends RectangleComponent with HasGameReference<MyGame> {
  PlayArea()
      : super(
          paint: Paint()..color = const Color(0xfff2e8cf),
          children: [
            RectangleHitbox()..collisionType = CollisionType.passive,
          ],
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(gameWidth, gameHeight);
  }
}
