import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final FlappyBirdGame flappyBirdGame;
  static const String id = "mainMenu";

  const MainMenu({super.key, required this.flappyBirdGame});

  @override
  Widget build(BuildContext context) {
    flappyBirdGame.pauseEngine();


    return Scaffold(
      body: GestureDetector(
        onTap: () {
          flappyBirdGame.overlays.remove(id);
          flappyBirdGame.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.menu), fit: BoxFit.cover)),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
