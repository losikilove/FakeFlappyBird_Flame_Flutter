import 'dart:async';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/components.dart';
import 'config.dart';

class MyGame extends FlameGame with HasCollisionDetection, TapCallbacks {
  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;
  late Bird _bird;

  MyGame()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    _bird = Bird(
        size: birdSize,
        position: Vector2(size.x / 4, size.y / 4),
        velocity: Vector2(0, height * .60));

    // display play area
    world.add(PlayArea());

    // display pillars
    world.add(StackPillar(position: Vector2(size.x / 2, 0)));

    // display bird
    world.add(_bird);

    //display axis
    debugMode = true;
  }

  void gameOver() {
    pauseEngine();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    _bird.fly();
  }
}
