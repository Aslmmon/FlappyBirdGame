import 'package:flappybird/flappyGame/Assets.dart';
import 'package:flappybird/flappyGame/flabby_bird_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  final FlappyBirdGame flappyBirdGame;
  static const String id = "mainMenu";

  const MainMenu({super.key, required this.flappyBirdGame});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    widget.flappyBirdGame.pauseEngine();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.flappyBirdGame.overlays.remove(MainMenu.id);
          widget.flappyBirdGame.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.menu), fit: BoxFit.cover)),
          child: ScaleTransition(
              scale: _animation, child: Image.asset(Assets.message)),
        ),
      ),
    );
  }
}
