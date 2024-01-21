import 'package:flame/game.dart';
import 'package:flappy_bird/screens/my_game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GameWidget(
        game: MyGame(),
      ),
    ),
  );
}
