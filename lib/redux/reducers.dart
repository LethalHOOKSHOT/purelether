import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/model/authorization_status.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/model/statistics.dart';
import 'package:untitled3/model/user.dart';
import 'package:untitled3/redux/app_state.dart';

import 'actions.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    statisticsLoadState:
        _statisticsLoadReducer(state.statisticsLoadState, action),
    userLoadState: _userLoadReduce(state.userLoadState, action),
    statistics: _statisticReducer(state.statistics, action),
    user: _userReducer(state.user, action),
    authorizationStatus:
        _authorizationStatusReducer(state.authorizationStatus, action));
Reducer<AuthorizationStatus> _authorizationStatusReducer = combineReducers([
  TypedReducer<AuthorizationStatus, SetNewAuthorizationStatusAction>(
      _setNewAuthorizationStatusReducer)
]);

Reducer<LoadState> _statisticsLoadReducer = combineReducers([
  TypedReducer<LoadState, SetNewStatisticsLoadedState>(
      _setNewStatisticsLoadReducer)
]);

LoadState _setNewStatisticsLoadReducer(
        LoadState loadState, SetNewStatisticsLoadedState action) =>
    action.loadState;

Reducer<LoadState> _userLoadReduce = combineReducers(
    [TypedReducer<LoadState, SetNewUserLoadedState>(_setNewUserLoadedReducer)]);

LoadState _setNewUserLoadedReducer(
        LoadState loadState, SetNewUserLoadedState action) =>
    action.loadState;

Reducer<User> _userReducer =
    combineReducers([TypedReducer<User, SaveUserAction>(_saveUserReducer)]);

User _saveUserReducer(User user, SaveUserAction action) => action.user;

Reducer<Statistics> _statisticReducer = combineReducers([
  TypedReducer<Statistics, SaveStatistics>(_saveStatisticsReducer),
  TypedReducer<Statistics, LoseAction>(_loseReducer),
  TypedReducer<Statistics, WinAction>(_winReducer),
  TypedReducer<Statistics, DrawAction>(_drawReducer),
  TypedReducer<Statistics, SetNewLastBattleAction>(_setNewLastBattleReducer)
]);

Statistics _saveStatisticsReducer(
        Statistics statistics, SaveStatistics action) =>
    action.statistics;

Statistics _loseReducer(Statistics statistics, LoseAction action) => Statistics(
    id: statistics.id,
    userId: statistics.userId,
    draws: statistics.draws,
    wins: statistics.wins,
    loses: statistics.loses + 1,
    lastBattleStatus: statistics.lastBattleStatus);

Statistics _winReducer(Statistics statistics, WinAction action) => Statistics(
    id: statistics.id,
    userId: statistics.userId,
    draws: statistics.draws,
    wins: statistics.wins + 1,
    loses: statistics.loses,
    lastBattleStatus: statistics.lastBattleStatus);

Statistics _drawReducer(Statistics statistics, DrawAction action) => Statistics(
    id: statistics.id,
    userId: statistics.userId,
    draws: statistics.draws + 1,
    wins: statistics.wins,
    loses: statistics.loses,
    lastBattleStatus: statistics.lastBattleStatus);

Statistics _setNewLastBattleReducer(
        Statistics statistics, SetNewLastBattleAction action) =>
    Statistics(
        id: statistics.id,
        userId: statistics.userId,
        draws: statistics.draws,
        wins: statistics.wins,
        loses: statistics.loses,
        lastBattleStatus: action.battleStatus);

AuthorizationStatus _setNewAuthorizationStatusReducer(
        AuthorizationStatus authorizationStatus,
        SetNewAuthorizationStatusAction action) =>
    action.authorizationStatus;
