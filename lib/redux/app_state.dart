import 'package:flutter/cupertino.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/model/statistics.dart';
import '../model/user.dart';
import '../model/authorization_status.dart';

@immutable
class AppState {
  final User user;
  final LoadState userLoadState;
  final Statistics statistics;
  final LoadState statisticsLoadState;
  final AuthorizationStatus authorizationStatus;

  const AppState({
    required this.user,
    required this.statistics,
    this.statisticsLoadState = LoadState.none,
    this.userLoadState = LoadState.none,
    this.authorizationStatus = AuthorizationStatus.notLoaded,
  });

  AppState.initialized()
      : user = User(id: "", nickname: "", password: ""),
        userLoadState = LoadState.none,
        statisticsLoadState = LoadState.none,
        authorizationStatus = AuthorizationStatus.notLoaded,
        statistics = Statistics(id: "", userId: "");

  bool isUserNotLoaded() {
    return userLoadState == LoadState.none;
  }

  bool isStatisticsNotLoaded() {
    return statisticsLoadState == LoadState.none;
  }
}
