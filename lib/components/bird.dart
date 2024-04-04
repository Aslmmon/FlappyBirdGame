import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/configuration/Configuration.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';
import 'package:flappybird/screens/game_over.dart';
import 'package:flutter/widgets.dart';

enum BirdMovement { up, middle, down }

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final upImage = await gameRef.loadSprite(Assets.birdUpFlap);
    final midImage = await gameRef.loadSprite(Assets.birdMidFlap);
    final downImage = await gameRef.loadSprite(Assets.birdDownFlap);
    size = Vector2(50, 40);
    current = BirdMovement.middle;
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.up: upImage,
      BirdMovement.middle: midImage,
      BirdMovement.down: downImage
    };

    add(CircleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    _gameOver();
  }

  void _gameOver() {
    gameRef.overlays.add(GameOver.id);
    gameRef.pauseEngine();
    gameRef.isHit = true;
    FlameAudio.play(Assets.collision);
  }

  void restartGame() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
  }

  void fly() {
    add(MoveByEffect(Vector2(0, Configuration.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down));
    current = BirdMovement.up;
    FlameAudio.play(Assets.flying);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Configuration.birdSpeed * dt;
    if (position.y < 1) {
      _gameOver();
    }
  }
}
