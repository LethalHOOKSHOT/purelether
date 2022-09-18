import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/widgets/game_screen/health_bar/state.dart';
import '../../redux/app_state.dart';
import 'battle_message/state.dart';
import 'battle_options/battle_options.dart';
import 'battle_status.dart';

@immutable
class GameState {
  final Store<AppState> prevStore;

  final Function prevDispatcher;

  final List<Health> healthBars;

  final SelectedParts selectedParts;

  final BattleMessage battleMessage;

  final BattleStatus battleStatus;

  final BattleStatus lastBattleResult;

  bool isContinue() {
    return battleStatus == BattleStatus.inProcess;
  }

  const GameState(
      this.selectedParts,
      this.healthBars,
      this.battleMessage,
      this.battleStatus,
      this.lastBattleResult,
      this.prevDispatcher,
      this.prevStore);

  GameState.initialized()
      : selectedParts = SelectedParts(BodyPart.none, BodyPart.none),
        healthBars = <Health>[5, 5],
        battleMessage = "Start",
        battleStatus = BattleStatus.inProcess,
        lastBattleResult = BattleStatus.inProcess,
        prevDispatcher = _emptyFunc,
        prevStore = Store<AppState>((state, action) => state,
            initialState: AppState.initialized());
}

void _emptyFunc() {}
