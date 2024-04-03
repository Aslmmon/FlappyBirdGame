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

    final availableVerticalSpace = gameRef.size.y - Configuration.groundHeight;
    final spacingBetweenPipes =
        100 + _random.nextDouble() * (availableVerticalSpace / 4);
    final centerY = spacingBetweenPipes +
        _random.nextDouble() * (availableVerticalSpace - spacingBetweenPipes);

    addAll([
      Pipe(
          height: centerY - spacingBetweenPipes / 2,
          pipeposition: PIPEPOSITION.top),
      Pipe(
          height: availableVerticalSpace - (centerY + spacingBetweenPipes / 2),
          pipeposition: PIPEPOSITION.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Configuration.gameVelocity * dt;
    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
  }
}
