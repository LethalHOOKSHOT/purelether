import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/text_styles/press_start_2_play.dart';
import 'package:untitled3/widgets/game_screen/state.dart';
import '../../../painters/painters.dart';
import '../actions.dart';
import '../battle_status.dart';
import 'battle_options.dart';

Widget goButton(Text text, BodyPart protectedPart, BodyPart attackedPrt,
    Store<GameState> store, BuildContext context) {
  return OutlinedButton(
      onPressed: (store.state.battleStatus == BattleStatus.inProcess)
          ? ((protectedPart != BodyPart.none) && (attackedPrt != BodyPart.none))
              ? () =>
                  store.dispatch(FightABattleAction(store.state.selectedParts))
              : () => {}
          : () => {Navigator.of(context).pop()},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            const Size(double.infinity, double.infinity)),
        side: MaterialStateProperty.all(BorderSide(
            color: ((protectedPart != BodyPart.none) &&
                    (attackedPrt != BodyPart.none))
                ? Painters.buttonColor["filled1"]!
                : Painters.buttonColor["disable1"]!)),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: MaterialStateProperty.all(
            ((protectedPart != BodyPart.none) && (attackedPrt != BodyPart.none))
                ? Painters.borderSideColor["filled1"]!
                : Painters.borderSideColor["disable1"]),
      ),
      child: text);
}

class GoButton extends StatelessWidget {
  final Text text;
  final BodyPart protectedPart;
  final BodyPart attackedPrt;
  final Store<GameState> store;

  const GoButton({
    super.key,
    required this.text,
    required this.protectedPart,
    required this.attackedPrt,
    required this.store,
  });

  GoButton.fromVM({
    super.key,
    required Store<GameState> vm,
  })  : text = Text(
          (vm.state.battleStatus == BattleStatus.inProcess) ? "Go" : "Back",
          style: PressStart2PlayTextStyles.p2s16white,
        ),
        protectedPart = vm.state.selectedParts.protectedPart,
        attackedPrt = vm.state.selectedParts.attackedPrt,
        store = vm;

  @override
  Widget build(BuildContext context) =>
      goButton(text, protectedPart, attackedPrt, store, context);
}
