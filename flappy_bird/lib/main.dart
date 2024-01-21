import 'package:flame/game.dart';
import 'package:flappy_bird/src/my_game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  final game = MyGame();
  runApp(GameWidget(game: game));
}
