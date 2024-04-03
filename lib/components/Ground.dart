import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/configuration/Configuration.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame>
    with HasGameRef<FlappyBirdGame> {
  Ground();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load(Assets.ground);
    parallax =
        Parallax([ParallaxLayer(ParallaxImage(image, fill: LayerFill.none))]);


    /**
     * HitBox for detecting collisions
     */
    add(RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Configuration.groundHeight),
        size: Vector2(gameRef.size.x, Configuration.groundHeight)));
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
