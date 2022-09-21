import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/painters/painters.dart';
import 'package:untitled3/text_styles/press_start_2_play.dart';
import 'package:untitled3/widgets/game_screen/state.dart';

import '../actions.dart';
import 'battle_options.dart';

Widget radioButton(
    {required Text text,
    required Store<GameState> store,
    required BodyPart bodyPart,
    required dynamic action,
    required BodyPart actualPart,
    required bool isActive}) {
  return OutlinedButton(
      onPressed: (isActive) ? () => store.dispatch(action) : () => {},
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, double.infinity)),
          backgroundColor: MaterialStateProperty.all((bodyPart == actualPart)
              ? Painters.radioButtonColor1
              : Painters.radioButtonColor2),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          side: MaterialStateProperty.all(BorderSide(
              color: (bodyPart != actualPart)
                  ? Painters.borderSideColor!
                  : Painters.borderSideColor["filled2"]!))),
      child: text);
}

class GameRadioButton extends StatelessWidget {
  final Text text;
  final Store<GameState> store;
  final BodyPart bodyPart;
  final dynamic action;
  final BodyPart actualPart;
  final bool isActive;

  const GameRadioButton(
      {super.key,
      required this.text,
      required this.store,
      required this.bodyPart,
      required this.action,
      required this.actualPart,
      required this.isActive});

  GameRadioButton.attack(
      {super.key,
      required this.store,
      required String content,
      required this.bodyPart,
      required this.isActive})
      : text = (store.state.selectedParts.attackedPrt != bodyPart)
            ? Text(
                content,
                style: PressStart2PlayTextStyles.p2s13blackFF161616,
              )
            : Text(
                content,
                style: PressStart2PlayTextStyles.p2s13white,
              ),
        action = SetNewAttackedPartAction(bodyPart),
        actualPart = store.state.selectedParts.attackedPrt;

  GameRadioButton.protect(
      {super.key,
      required this.store,
      required String content,
      required this.bodyPart,
      required this.isActive})
      : action = SetNewBlockedPartAction(bodyPart),
        text = (store.state.selectedParts.protectedPart != bodyPart)
            ? Text(
                content,
                style: PressStart2PlayTextStyles.p2s13blackFF161616,
              )
            : Text(
                content,
                style: PressStart2PlayTextStyles.p2s13white,
              ),
        actualPart = store.state.selectedParts.protectedPart;

  @override
  Widget build(BuildContext context) => radioButton(
      text: text,
      store: store,
      bodyPart: bodyPart,
      action: action,
      actualPart: actualPart,
      isActive: isActive);
}
