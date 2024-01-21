import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Bird extends RectangleComponent with TapCallbacks {
  final double _limitation = 5.0;

  Bird({super.position, super.size, super.paint});

  @override
  void update(double dt) {
    // position = Vector2(position.x, position.y + _limitation);
  }

  @override
  void onTapDown(TapDownEvent event) {}
}
