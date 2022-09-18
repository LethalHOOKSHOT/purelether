import 'package:flutter/material.dart';
import 'mobile_game_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LayoutBuilder(builder: gameScreenBuilder);
  }
}

Widget gameScreenBuilder(BuildContext context, BoxConstraints constraints) {
  return const MobileGameScreenWidget();
}
