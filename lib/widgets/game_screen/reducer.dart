import 'package:redux/redux.dart';
import 'package:untitled3/model/props.dart';
import 'package:untitled3/widgets/game_screen/actions.dart';
import 'package:untitled3/widgets/game_screen/battle_options/battle_options.dart';
import 'package:untitled3/widgets/game_screen/state.dart';

import '../../redux/app_state.dart';
import 'battle_message/state.dart';
import 'battle_options/state.dart';
import 'battle_status.dart';
import 'health_bar/state.dart';

GameState gameReducer(GameState state, dynamic action) => GameState(
    _battleOptionsReducer(state.selectedParts, action),
    _playerHealthBarReducer(state.healthBars, action),
    _battleMessageReducer(state.battleMessage, action),
    _battleStatusReducer(state.battleStatus, action),
    _lastBattleReducer(state.lastBattleResult, action),
    prevDispatcherReducer(state.prevDispatcher, action),
    prevStoreReducer(state.prevStore, action));
Reducer<Store<AppState>> prevStoreReducer = combineReducers(
    [TypedReducer<Store<AppState>, SetNewStoreAction>(setNewStoreReducer)]);

Store<AppState> setNewStoreReducer(
        Store<AppState> store, SetNewStoreAction action) =>
    action.newStore;
Reducer<Function> prevDispatcherReducer = combineReducers(
    [TypedReducer<Function, SetNewDispatcherAction>(setNewDispatcherReducer)]);

Function setNewDispatcherReducer(
        Function reducer, SetNewDispatcherAction action) =>
    action.dispatcher;

Reducer<List<Health>> _playerHealthBarReducer = combineReducers([
  TypedReducer<List<Health>, PlayerTakeHitAction>(_playerTakeHitReducer),
  TypedReducer<List<Health>, PlayerFullHealAction>(_playerTFullHealReducer)
]);

Reducer<BattleMessage> _battleMessageReducer = combineReducers([
  TypedReducer<BattleMessage, SetNewBattleMessageAction>(
      _setNewBattleMessageReducer)
]);

Reducer<BattleStatus> _battleStatusReducer = combineReducers(
  [
    TypedReducer<BattleStatus, SetNewBattleStatusAction>(
        _setNewBattleStatusReducer)
  ],
);

BattleStatus _setNewBattleStatusReducer(
    BattleStatus battleStatus, SetNewBattleStatusAction action) {
  return action.newBattleStatusAction;
}

List<Health> _playerTakeHitReducer(
    List<Health> playersHealthBar, PlayerTakeHitAction action) {
  List<Health> healthBars = List.of(playersHealthBar);
  healthBars[action.id] = healthBars[action.id] - 1;
  return healthBars;
}

List<Health> _playerTFullHealReducer(
    List<Health> playersHealthBar, PlayerFullHealAction action) {
  List<Health> healthBars = List.of(playersHealthBar);
  for (int i = 0; i < healthBars.length; i++) {
    healthBars[i] = maxHealthProp;
  }
  return healthBars;
}

BattleMessage _setNewBattleMessageReducer(
        BattleMessage battleMessage, SetNewBattleMessageAction action) =>
    action.message;

Reducer<SelectedParts> _battleOptionsReducer = combineReducers([
  TypedReducer<SelectedParts, SetNewAttackedPartAction>(
      _setNewAttackOptionReducer),
  TypedReducer<SelectedParts, SetNewBlockedPartAction>(
      _setNewBlockedPartOptionReducer)
]);

SelectedParts _setNewAttackOptionReducer(
        SelectedParts state, SetNewAttackedPartAction action) =>
    SelectedParts(state.protectedPart, action.newAttackedPart);

SelectedParts _setNewBlockedPartOptionReducer(
        SelectedParts state, SetNewBlockedPartAction action) =>
    SelectedParts(action.newBlockedPart, state.attackedPrt);

Reducer<BattleStatus> _lastBattleReducer = combineReducers([
  TypedReducer<BattleStatus, SetLastBattleResultAction>(
      _setLastBattleResultReducer)
]);

BattleStatus _setLastBattleResultReducer(
        BattleStatus battleStatus, SetLastBattleResultAction action) =>
    action.battleStatus;
