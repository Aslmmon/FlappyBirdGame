import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/components/Ground.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';
import 'package:flappybird/configuration/Configuration.dart';

import '../components/pipe_group.dart';

class FlappyBirdGame extends FlameGame with TapDetector,HasCollisionDetection {
  late final bird = Bird();
  Timer interval = Timer(Configuration.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird,
    ]);
    interval.onTick = () => add(pipeGroup());
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
