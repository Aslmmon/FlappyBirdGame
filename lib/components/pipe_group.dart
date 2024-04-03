import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/components/Pipe.dart';
import 'package:flappybird/configuration/Configuration.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

class pipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  pipeGroup();

  final _random = Random();
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    addAll([
      Pipe(height: 100, pipeposition: PIPEPOSITION.top),
      Pipe(height: 200, pipeposition: PIPEPOSITION.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Configuration.gameVelocity * dt;
  }
}
