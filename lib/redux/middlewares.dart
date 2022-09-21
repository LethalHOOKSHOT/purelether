import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/redux/actions.dart';
import 'package:untitled3/redux/app_state.dart';

import '../model/load_state.dart';
import '../model/statistics.dart';
import '../model/user.dart';
import '../repository/repository.dart';
import '../widgets/game_screen/actions.dart';

List<Middleware<AppState>> createAppMiddleware(Repository repository) {
  final getUser = getUserMiddleware(repository);
  final getStatistics = getStatisticsMiddleware(repository);
  final ensure = ensureThatNewMiddleware(repository);
  final setStat = setStatisticsInFirestoreMiddleware(repository);
  final setUser = setUserInFirestoreMiddleware(repository);
  final loadStat = _loadStatisticsMiddleware(repository);
  return [
    TypedMiddleware<AppState, SetStatisticsInFirestoreAction>(setStat),
    TypedMiddleware<AppState, SetUserInFirestoreAction>(setUser),
    TypedMiddleware<AppState, EnsureThatNewAction>(ensure),
    TypedMiddleware<AppState, LoadStatistic>(loadStat),
    TypedMiddleware<AppState, SaveStatisticsInFireStoreAction>(
        saveStatisticsInFirestoreMiddleware),
    TypedMiddleware<AppState, GetUserAction>(getUser),
    TypedMiddleware<AppState, GetStatisticsAction>(getStatistics),
  ];
}

Middleware<AppState> getUserMiddleware(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is GetUserAction) {
      try {
        store.dispatch(SetNewUserLoadedState(LoadState.loading));
        User user = await repository.getUser(action.name);
        if (user.password == action.password) {
          store.dispatch(SaveUserAction(user));
          store.dispatch(SetNewUserLoadedState(LoadState.loaded));
        } else {
          store.dispatch(SetNewUserLoadedState(LoadState.error));
        }
      } catch (e) {
        store.dispatch(SetNewUserLoadedState(LoadState.error));
      }
    }
    next(action);
  };
}

Middleware<AppState> ensureThatNewMiddleware(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is EnsureThatNewAction) {
      try {
        store.dispatch(SetNewUserLoadedState(LoadState.loading));
        await repository.getUser(action.userName);
        store.dispatch(SetNewUserLoadedState(LoadState.loaded));
      } catch (e) {
        store.dispatch(SetNewUserLoadedState(LoadState.error));
      }
    }
    next(action);
  };
}

Middleware<AppState> getStatisticsMiddleware(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    try {
      if (action is GetStatisticsAction) {
        Statistics statistics = await repository.getStatistics(action.user);
        store.dispatch(SaveStatistics(statistics));
        store.dispatch(SetNewStatisticsLoadedState(LoadState.loaded));
      }
    } catch (e) {
      store.dispatch(SetNewStatisticsLoadedState(LoadState.error));
    }
    next(action);
  };
}

Middleware<AppState> setUserInFirestoreMiddleware(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is SetUserInFirestoreAction) {
      var dockUser = FirebaseFirestore.instance.collection("users").doc();
      User user = User(
          id: dockUser.id,
          nickname: action.nickname,
          password: action.password);
      repository.saveUser(user);
      store.dispatch(SaveUserAction(user));
      store.dispatch(SetNewUserLoadedState(LoadState.loaded));
    }
  };
}

Middleware<AppState> setStatisticsInFirestoreMiddleware(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is SetStatisticsInFirestoreAction) {
      var dockStat = FirebaseFirestore.instance.collection("statistics").doc();
      Statistics statistics =
          Statistics(id: dockStat.id, userId: action.userId);
      repository.saveStatistics(statistics);
      store.dispatch(SaveStatistics(statistics));
      store.dispatch(SetNewStatisticsLoadedState(LoadState.loaded));
    }
    next(action);
  };
}

Middleware<AppState> _loadStatisticsMiddleware(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is LoadStatistic) {
      Statistics statistics = await repository.getStatistics(store.state.user);
      store.dispatch(SaveStatistics(statistics));
      store.dispatch(SetNewStatisticsLoadedState(LoadState.loaded));
    }
    next(action);
  };
}

void saveStatisticsInFirestoreMiddleware(Store<AppState> store,
    SaveStatisticsInFireStoreAction action, NextDispatcher next) async {
  await FirebaseFirestore.instance
      .collection("statistics")
      .doc(store.state.statistics.id)
      .update(store.state.statistics.toJson());
  next(action);
}
