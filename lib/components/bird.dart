import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

enum BirdMovement { up, middle, down }

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  Bird();

  @override
  Future<void> onLoad() async {
    final upImage = await gameRef.loadSprite(Assets.birdUpFlap);
    final midImage = await gameRef.loadSprite(Assets.birdMidFlap);
    final downImage = await gameRef.loadSprite(Assets.birdDownFlap);
    size = Vector2(50, 40);
    current = BirdMovement.middle;
    position = Vector2(50, gameRef.size.y /2 - size.y /2);
    sprites = {
      BirdMovement.up: upImage,
      BirdMovement.middle: midImage,
      BirdMovement.down: downImage
    };
  }
}
