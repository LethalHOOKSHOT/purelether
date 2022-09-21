import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/painters/painters.dart';
import 'package:untitled3/redux/app_state.dart';
import 'package:untitled3/styles/button_styles/button_styles.dart';
import 'package:untitled3/text_styles/text_styles.dart';
import 'package:untitled3/widgets/game_screen/actions.dart';
import 'package:untitled3/widgets/game_screen/battle_status.dart';

import '../../model/load_state.dart';
import '../no_logged/no_logged.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Painters.screenBackgroundColor,
      body: StoreConnector<AppState, Store<AppState>>(
        converter: (Store<AppState> store) {
          return store;
        },
        builder: (context, vm) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 70,
                  width: 200,
                  child: NoLoggedWidget(
                      isDisabled: vm.state.userLoadState == LoadState.loaded),
                ),
              ),
              // отключено
              Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Text(
                          "THE\nFIGHT\nCLUB",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.pressStart2p(
                              textStyle: const TextStyle(
                            fontSize: 30,
                            height: 4 / 3,
                            color: Painters.nextTextColor,
                            decoration: TextDecoration.none,
                          )),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 5),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: OutlinedButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, "/statistics"),
                          vm.dispatch(StartNewBattleAction())
                        },
                        style: SimpleButtonStyles.white,
                        child: Text(
                          "STATISTICS",
                          style: GoogleFonts.pressStart2p(
                              textStyle: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 13,
                                  height: 24 / 13,
                                  color: Painters.nextTextColor)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: OutlinedButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, "/loom"),
                          vm.dispatch(StartNewBattleAction())
                        },
                        style: SimpleButtonStyles.black,
                        child: Text(
                          "START",
                          style: GoogleFonts.pressStart2p(
                              textStyle: PressStart2PlayTextStyles.p2s16white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder(future: load(vm), builder: lastBattleWidget(vm)),
            ],
          );
        },
      ),
    );
  }

  Widget Function(BuildContext context, AsyncSnapshot snapshot)
      lastBattleWidget(Store<AppState> appStore) {
    return (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return const CircularProgressIndicator();
      }
      return (appStore.state.statistics.lastBattleStatus ==
              BattleStatus.inProcess)
          ? const SizedBox.shrink()
          : Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Last fight result",
                    style: PressStart2PlayTextStyles.p2sBlack,
                  ),
                  const Gap(12),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Painters.gradientColor1,
                            ),
                            child: Align(
                                alignment: const Alignment(0.5, -0.1),
                                child: Builder(
                                    builder: playerIcon(
                                        "assets/img/player.png", "You"))),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        Painters.gradientColor1,
                                        Painters.gradientColor2
                                      ],
                                      tileMode: TileMode.mirror)),
                              child: Align(
                                alignment: const Alignment(0, 0.22),
                                child: FutureBuilder(
                                    builder: lastBattleStatusIcon(appStore)),
                              )),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Painters.gradientColor2,
                            ),
                            child: Align(
                                alignment: const Alignment(-0.5, -0.1),
                                child: Builder(
                                    builder: playerIcon(
                                        "assets/img/enemy.png", "Enemy"))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
    };
  }

  Widget Function(BuildContext context, AsyncSnapshot snapshot)
      lastBattleStatusIcon(Store<AppState> appStore) {
    return (BuildContext context, AsyncSnapshot snapshot) {
      Color iconColor() {
        if (appStore.state.statistics.lastBattleStatus ==
            BattleStatus.youLost) {
          return Painters.loseIconColor;
        } else if (appStore.state.statistics.lastBattleStatus ==
            BattleStatus.youWin) {
          return Painters.winIconColor;
        } else {
          return Painters.drawIconColor;
        }
      }

      String iconText() {
        if (appStore.state.statistics.lastBattleStatus ==
            BattleStatus.youLost) {
          return "lost";
        } else if (appStore.state.statistics.lastBattleStatus ==
            BattleStatus.youWin) {
          return "won";
        } else {
          return "draw";
        }
      }

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44), color: iconColor()),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            iconText(),
            style: PressStart2PlayTextStyles.p2s16white,
          ),
        ),
      );
    };
  }

  Widget Function(BuildContext context) playerIcon(String path, String title) =>
      (BuildContext context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: Text(
                  title,
                  style: PressStart2PlayTextStyles.p2sBlack,
                ),
              ),
              Expanded(
                child: Image.asset(
                  path,
                ),
              ),
              const Gap(29)
            ],
          );

  Future<LoadState> load(Store<AppState> store) async {
    if (store.state.statisticsLoadState != LoadState.loaded) {
      store.dispatch(LoadStatistic());
      return LoadState.loaded;
    } else {
      return LoadState.loaded;
    }
  }
}
