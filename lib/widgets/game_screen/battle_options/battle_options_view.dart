import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/widgets/game_screen/state.dart';

import '../../../text_styles/press_start_2_play.dart';
import 'battle_options.dart';

class BattleOptionsStored extends StatelessWidget {
  const BattleOptionsStored({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, Store<GameState>>(
      builder: (context, vm) => Column(
        children: [
          Flexible(
            flex: 10,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              "ATTACK",
                              style: GoogleFonts.pressStart2p(
                                textStyle:
                                    PressStart2PlayTextStyles.p2s16blackFF161616,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: GameRadioButton.attack(
                                  store: vm,
                                  content: "HEAD",
                                  bodyPart: BodyPart.head,
                                  isActive: vm.state.isContinue()),
                            )),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: GameRadioButton.attack(
                                  store: vm,
                                  content: "TORSO",
                                  bodyPart: BodyPart.torso,
                                  isActive: vm.state.isContinue()),
                            )),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: GameRadioButton.attack(
                                  store: vm,
                                  content: "LEGS",
                                  bodyPart: BodyPart.legs,
                                  isActive: vm.state.isContinue()),
                            ))
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              "DEFEND",
                              style: GoogleFonts.pressStart2p(
                                textStyle:
                                    PressStart2PlayTextStyles.p2s16blackFF161616,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: GameRadioButton.protect(
                                  store: vm,
                                  content: "HEAD",
                                  bodyPart: BodyPart.head,
                                  isActive: vm.state.isContinue()),
                            )),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: GameRadioButton.protect(
                                  store: vm,
                                  content: "TORSO",
                                  bodyPart: BodyPart.torso,
                                  isActive: vm.state.isContinue()),
                            )),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: GameRadioButton.protect(
                                  store: vm,
                                  content: "LEGS",
                                  bodyPart: BodyPart.legs,
                                  isActive: vm.state.isContinue()),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 5),
                  child: GoButton.fromVM(vm: vm)))
        ],
      ),
      converter: (store) => store,
    );
  }
}
