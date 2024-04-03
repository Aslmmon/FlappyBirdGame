import 'package:flame/game.dart';
import 'package:flappybird/components/Ground.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';

class FlappyBirdGame extends FlameGame {


  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      Bird()
    ]);
  }
}
