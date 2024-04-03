import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/configuration/Configuration.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

enum PIPEPOSITION { top, bottom }

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  @override
  final double height;
  final PIPEPOSITION pipeposition;

  Pipe({required this.height, required this.pipeposition});

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);
    switch (pipeposition) {
      case PIPEPOSITION.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PIPEPOSITION.bottom:
        position.y = gameRef.size.y - size.y - Configuration.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
