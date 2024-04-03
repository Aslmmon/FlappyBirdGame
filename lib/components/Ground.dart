import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/configuration/Configuration.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame>{
  Ground();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(ParallaxImage(image,fill: LayerFill.none))
    ]);
    return super.onLoad();
  }


  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Configuration.gameVelocity;
  }

}