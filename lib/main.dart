import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'flappyGame/flabby_bird_game.dart';

void main() {
  final flappyBirdGame = FlappyBirdGame();

  runApp(GameWidget(game: flappyBirdGame));
}
