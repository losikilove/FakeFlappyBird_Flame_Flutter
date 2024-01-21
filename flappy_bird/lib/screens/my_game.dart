import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flappy_bird/objects/bird.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  late Bird _bird;

  @override
  Future<void> onLoad() async {
    _bird = Bird(
        size: Vector2.all(50),
        position: size / 2,
        paint: BasicPalette.red.paint());

    await add(_bird);
  }
}
