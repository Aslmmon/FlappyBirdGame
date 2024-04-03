import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

import '../configuration/Configuration.dart';

class Background extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  Background();

  @override
  Future<void> onLoad()  async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    parallax =
        Parallax([ParallaxLayer(ParallaxImage(background, fill: LayerFill.height))]);

  //  sprite = Sprite(background);
  }

  @override
  void update(double dt) {
    super.update(dt);
    /**
     * move parralax of ground  with specific velocity
     */
    parallax?.baseVelocity.x = Configuration.gameVelocity;
  }
}