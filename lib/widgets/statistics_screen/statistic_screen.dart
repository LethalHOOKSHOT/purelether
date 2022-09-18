import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/painters/painters.dart';
import 'package:untitled3/redux/app_state.dart';
import 'package:untitled3/text_styles/text_styles.dart';
import 'package:untitled3/widgets/game_screen/actions.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  StatisticsScreenState createState() => StatisticsScreenState();
}

class StatisticsScreenState extends State<StatisticsScreen> {
  late Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Painters.screenBackgroundColor,
      body: SafeArea(
        child: StoreConnector(
          builder: (BuildContext context, vm) {
            return Column(
              children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: SizedBox(
                        child: Text(
                          "Statistics",
                          style: PressStart2PlayTextStyles.p2s24black,
                        ),
                      )),
                ),
                Expanded(
                    child: FutureBuilder(
                  future: load(),
                  builder: (context, snapshot) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: (((store.state.statistics.wins == 0) &
                                    (store.state.statistics.loses == 0) &
                                    (store.state.statistics.draws == 0)))
                            ? []
                            : [
                                Text(
                                  "Won: ${store.state.statistics.wins.toString()}",
                                  style:
                                      PressStart2PlayTextStyles.p2s16blackFF161616,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Draw: ${store.state.statistics.draws.toString()}",
                                  style:
                                      PressStart2PlayTextStyles.p2s16blackFF161616,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Lost: ${store.state.statistics.loses.toString()}",
                                  style:
                                      PressStart2PlayTextStyles.p2s16blackFF161616,
                                )
                              ],
                      ),
                    );
                  },
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xFFF5F5F5)),
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 40)),
                          overlayColor:
                              MaterialStateProperty.all(Colors.white24),
                          side: MaterialStateProperty.all(const BorderSide()),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero))),
                      child: Text(
                        "BACK",
                        style: PressStart2PlayTextStyles.p2s13blackFF161616,
                      )),
                ),
              ],
            );
          },
          converter: (Store<AppState> storeVM) {
            store = storeVM;
          },
        ),
      ),
    );
  }

  Future<bool> load() async {
    if (store.state.statisticsLoadState != LoadState.loaded) {
      store.dispatch(LoadStatistic());
      return true;
    }
    return false;
  }
}
