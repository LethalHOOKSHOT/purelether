import 'package:untitled3/model/authorization_status.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/model/statistics.dart';
import 'package:untitled3/widgets/game_screen/battle_status.dart';

import '../model/user.dart';

class SaveStatistics {
  Statistics statistics;

  SaveStatistics(this.statistics);
}

class SetNewUserLoadedState {
  LoadState loadState;

  SetNewUserLoadedState(this.loadState);
}

class SetNewStatisticsLoadedState {
  LoadState loadState;

  SetNewStatisticsLoadedState(this.loadState);
}

class SaveUserAction {
  User user;

  SaveUserAction(this.user);
}

class LoseAction {}

class WinAction {}

class DrawAction {}

class SetNewLastBattleAction {
  BattleStatus battleStatus;

  SetNewLastBattleAction(this.battleStatus);
}

class SaveUserInFireStore {}

class SaveStatisticsInFireStoreAction {}

class EnsureThatNewAction {
  final String userName;

  EnsureThatNewAction(this.userName);
}

class SetUserInFirestoreAction {
  final String password;
  final String nickname;

  SetUserInFirestoreAction(this.nickname, this.password);
}

class SetStatisticsInFirestoreAction {
  final String userId;

  SetStatisticsInFirestoreAction(this.userId);
}

class SetNewAuthorizationStatusAction {
  final AuthorizationStatus authorizationStatus;

  SetNewAuthorizationStatusAction(this.authorizationStatus);
}
