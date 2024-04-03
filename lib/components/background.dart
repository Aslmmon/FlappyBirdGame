import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  Background();

  @override
  Future<void> onLoad()  async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}