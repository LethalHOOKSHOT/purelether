import 'dart:math';

import 'package:redux/redux.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/redux/actions.dart';
import 'package:untitled3/widgets/game_screen/actions.dart';
import 'package:untitled3/widgets/game_screen/battle_options/body_part.dart';
import 'package:untitled3/widgets/game_screen/battle_options/state.dart';
import 'package:untitled3/widgets/game_screen/battle_status.dart';
import 'package:untitled3/widgets/game_screen/state.dart';

List<Middleware<GameState>> gameMiddleware() {
  final battle = _fightABattle();

  final endOfBattle = _endOfAGame();

  return [
    TypedMiddleware<GameState, FightABattleAction>(battle),
    TypedMiddleware<GameState, EndOfTheFightAction>(endOfBattle),
    TypedMiddleware<GameState, StartNewBattleAction>(_startBattle),
  ];
}

Middleware<GameState> _endOfAGame() {
  return (Store<GameState> store, action, NextDispatcher next) {
    next(action);
    if (action is EndOfTheFightAction) {
      if (store.state.healthBars[0] <= 0 && store.state.healthBars[1] >= 1) {
        store.dispatch(SetNewBattleStatusAction(BattleStatus.youLost));
        store.dispatch(SetNewBattleMessageAction("You lose"));
        store.state.prevDispatcher(LoseAction());
        store.state
            .prevDispatcher(SetNewLastBattleAction(BattleStatus.youLost));
        store.state.prevDispatcher(SaveStatisticsInFireStoreAction());
      } else if (store.state.healthBars[0] >= 1 &&
          store.state.healthBars[1] <= 0) {
        store.dispatch(SetNewBattleStatusAction(BattleStatus.youWin));
        store.dispatch(SetNewBattleMessageAction("You win"));
        store.state.prevDispatcher(WinAction());
        store.state.prevDispatcher(SetNewLastBattleAction(BattleStatus.youWin));
        store.state.prevDispatcher(SaveStatisticsInFireStoreAction());
      } else if (store.state.healthBars[0] <= 0 &&
          store.state.healthBars[1] <= 0) {
        store.dispatch(SetNewBattleStatusAction(BattleStatus.draw));
        store.dispatch(SetNewBattleMessageAction("draw"));
        store.state.prevDispatcher(DrawAction());
        store.state.prevDispatcher(SetNewLastBattleAction(BattleStatus.draw));
        store.state.prevDispatcher(SaveStatisticsInFireStoreAction());
      } else {
        store.dispatch(SetNewBattleMessageAction("undefined${store.state.healthBars[0]} ${store.state.healthBars[1]}"));
      }
      store.state.prevDispatcher(SaveStatisticsInFireStoreAction());
    }
  };
}

Middleware<GameState> _fightABattle() {
  return (Store<GameState> store, action, NextDispatcher next) {
    if (action is FightABattleAction) {
      var botChoice = _botChoices();
      String message = "";

      if (botChoice.protectedPart != store.state.selectedParts.attackedPrt) {
        store.dispatch(PlayerTakeHitAction(1));
        message += "Enemy succesfuly attacked";
      } else {
        message += "Your attack was blocked";
      }
      if (botChoice.attackedPrt != store.state.selectedParts.protectedPart) {
        store.dispatch(PlayerTakeHitAction(0));
        message += "\nYou succesfuly attacked";
      } else {
        message += "\nEnemy's attack was blocked";
      }
      if (store.state.healthBars[0] <= 0 || store.state.healthBars[1] <= 0) {
        store.dispatch(EndOfTheFightAction());
      } else {
        store.dispatch(SetNewBattleMessageAction(message));
      }
      store.dispatch(SetNewBlockedPartAction(BodyPart.none));
      store.dispatch(SetNewAttackedPartAction(BodyPart.none));
    }
    next(action);
  };
}

SelectedParts _botChoices() {
  var rand = Random();
  return SelectedParts(BodyPart.values[rand.nextInt(BodyPart.values.length)],
      BodyPart.values[rand.nextInt(BodyPart.values.length)]);
}

void _startBattle(Store<GameState> store, StartNewBattleAction action,
    NextDispatcher next) async {
  next(action);
  store.state.prevDispatcher(LoadStatistic());
  store.dispatch(SetNewBattleStatusAction(BattleStatus.inProcess));
  store.dispatch(PlayerFullHealAction());
  if (store.state.prevStore.state.isStatisticsNotLoaded()) {
    store.state.prevDispatcher(LoadStatistic());
    store.dispatch(SetNewStatisticsLoadedState(LoadState.loaded));
  }
}
