import 'package:flame/game.dart';
import 'package:flappybird/screens/game_over.dart';
import 'package:flappybird/screens/main_menu.dart';
import 'package:flutter/material.dart';

import 'flappyGame/flabby_bird_game.dart';

void main() {
  final flappyBirdGame = FlappyBirdGame();

  runApp(GameWidget(game: flappyBirdGame, initialActiveOverlays: const [
    MainMenu.id
  ], overlayBuilderMap: {
    MainMenu.id: (context, _) => MainMenu(flappyBirdGame: flappyBirdGame),
    GameOver.id: (context, _) => GameOver(flappyBirdGame: flappyBirdGame)
  }));
}
