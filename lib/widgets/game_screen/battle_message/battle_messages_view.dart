import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled3/painters/painters.dart';
import 'package:untitled3/text_styles/text_styles.dart';
import 'package:untitled3/widgets/game_screen/battle_message/state.dart';
import 'package:untitled3/widgets/game_screen/state.dart';

class BattleMessageStored extends StatelessWidget {
  const BattleMessageStored({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BattleMessage>(
      converter: (store) => store.state.battleMessage,
      builder: (context, vm) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: SizedBox(
          child: Container(
            color: Painters.boxColor[2],
            child: Center(
                child: Text(vm,
                    textAlign: TextAlign.center,
                    style: PressStart2PlayTextStyles.p2s10h2black)),
          ),
        ),
      ),
    );
  }
}
