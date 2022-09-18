import 'package:flutter/material.dart';
import 'package:untitled3/painters/painters.dart';
import 'package:untitled3/redux/app_state.dart';
import 'package:untitled3/widgets/game_screen/battle_options/battle_options.dart';
import 'package:untitled3/widgets/game_screen/reducer.dart';
import 'package:untitled3/widgets/game_screen/state.dart';
import 'actions.dart';
import 'battle_message/battle_messages.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../painters/painters.dart';
import '../../widgets/game_screen/battle_info_component/battle_info_component.dart';
import 'battle_options/battle_options.dart';
import 'middlewares.dart';

class MobileGameScreenWidget extends StatefulWidget {
  const MobileGameScreenWidget({Key? key}) : super(key: key);

  @override
  MobileGameScreenWidgetState createState() => MobileGameScreenWidgetState();
}

class MobileGameScreenWidgetState extends State<MobileGameScreenWidget> {
  final battleStore = Store(gameReducer,
      middleware: gameMiddleware(), initialState: GameState.initialized());

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    battleStore.dispatch(SetNewDispatcherAction(store.dispatch));
    battleStore.dispatch(SetNewStoreAction(store));
    return Scaffold(
        body: SafeArea(
      child: Builder(
        builder: (BuildContext context) => StoreProvider(
          store: battleStore,
          child: CustomPaint(
            painter: MyGradientPainter(),
            child: Column(
              children: const [
                Flexible(flex: 4, child: BattleInfoStored()),
                Flexible(
                    flex: 5,
                    child: Padding(
                        padding: EdgeInsets.only(top: 20,bottom: 30),
                        child: BattleMessageStored())),
                Flexible(flex: 6, child: BattleOptionsStored())
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

