import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOver extends StatelessWidget {
  final FlappyBirdGame flappyBirdGame;
  static const id = "gameOver";

  const GameOver({super.key, required this.flappyBirdGame});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "score :${flappyBirdGame.bird.score}",
              style: const TextStyle(
                  fontSize: 60, color: Colors.white, fontFamily: Assets.fontStyle),
            ),
            const Image(image: AssetImage(Assets.gameOver)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void onRestart() {
    flappyBirdGame.bird.restartGame();
    flappyBirdGame.overlays.remove(id);
    flappyBirdGame.resumeEngine();
    flappyBirdGame.bird.score = 0;
  }
}
