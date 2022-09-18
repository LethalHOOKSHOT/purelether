import 'package:redux/redux.dart';
import 'package:untitled3/redux/app_state.dart';
import 'package:untitled3/widgets/game_screen/battle_options/battle_options.dart';
import 'package:untitled3/widgets/game_screen/health_bar/state.dart';

import '../../model/user.dart';
import 'battle_status.dart';

class PlayerTakeHitAction {
  final int id;

  PlayerTakeHitAction(this.id);
}

class PlayerFullHealAction {}

class APlayerTakeHitAction {
  final Health healthBarState;

  APlayerTakeHitAction(this.healthBarState);
}

class SetNewBattleMessageAction {
  final String message;

  SetNewBattleMessageAction(this.message);
}

class SetNewAttackedPartAction {
  final BodyPart newAttackedPart;

  SetNewAttackedPartAction(this.newAttackedPart);
}

class SetNewBlockedPartAction {
  final BodyPart newBlockedPart;

  SetNewBlockedPartAction(this.newBlockedPart);
}

class FightABattleAction {
  final SelectedParts playerChoice;

  FightABattleAction(this.playerChoice);
}

class SetNewBattleStatusAction {
  final BattleStatus newBattleStatusAction;

  SetNewBattleStatusAction(this.newBattleStatusAction);
}

class EndOfTheFightAction {}

class StartNewBattleAction {}

class SetLastBattleResultAction {
  final BattleStatus battleStatus;

  SetLastBattleResultAction(this.battleStatus);
}

class SetNewDispatcherAction {
  final Function dispatcher;

  SetNewDispatcherAction(this.dispatcher);
}

class SetNewStoreAction {
  final Store<AppState> newStore;

  SetNewStoreAction(this.newStore);
}

class LoadStatistic {}

class GetUserAction {
  final String name;
  final String password;

  GetUserAction({required this.name, required this.password});
}

class GetStatisticsAction {
  final User user;

  GetStatisticsAction(this.user);
}
