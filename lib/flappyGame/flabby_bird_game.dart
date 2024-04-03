import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/src/text/renderers/text_renderer.dart';
import 'package:flappybird/components/Ground.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';
import 'package:flappybird/configuration/Configuration.dart';
import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/pipe_group.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late final bird = Bird();

  /// time interval for creating pipes after each interval of time
  Timer interval = Timer(Configuration.pipeInterval, repeat: true);

  /// is hit refrence to pipe on collision with flappyBird ., removed after reseting the game again.

  bool isHit = false;

  late TextBoxComponent score;

  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground(), bird, score = _buildScore()]);
    interval.onTick = () => add(pipeGroup());
  }

  TextBoxComponent<TextRenderer> _buildScore() {
    return TextBoxComponent(
        text: "score 0",
        position: Vector2(size.x / 2, (size.y / 2 * 0.2)),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: Assets.fontStyle,
                color: Colors.white)));
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = "score:  ${bird.score}";
  }
}
