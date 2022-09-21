import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled3/painters/painters.dart';
import 'package:untitled3/text_styles/press_start_2_play.dart';

import '../health_bar/health_bar.dart';

class BattleInfoStored extends StatelessWidget {
  const BattleInfoStored({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
            height: double.infinity,
            child: Stack(children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Painters.gradientColor1))),
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
                                  tileMode: TileMode.mirror)))),
                  Flexible(
                    flex: 1,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Painters.gradientColor2)),
                  ),
                ],
              ),
              Positioned(
                  top: 16,
                  left: 16,
                  child: Row(children: [
                    const HealthBarStored(id: 0, width: 18),
                    const Gap(22),
                    Column(children: [
                      Text(
                        "You",
                        style: PressStart2PlayTextStyles.p2s14,
                      ),
                      const Gap(23),
                      Image.asset("assets/img/player.png",
                          width: 80, height: 72)
                    ])
                  ])),
              Center(
                  child: Column(children: [
                const Spacer(flex: 2),
                Flexible(
                    flex: 1,
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Painters.boxColor),
                        child: Center(
                            child: Text(
                          "vs",
                          style: PressStart2PlayTextStyles.p2s16white,
                        )))),
                const Spacer(flex: 1)
              ])),
              Positioned(
                  top: 16,
                  right: 16,
                  child: Row(children: [
                    Column(children: [
                      Text(
                        "Enemy",
                        style: PressStart2PlayTextStyles.p2s14,
                      ),
                      const SizedBox(height: 23),
                      Image.asset("assets/img/enemy.png", width: 80, height: 72)
                    ]),
                    const Gap(22),
                    const HealthBarStored(id: 1, width: 18)
                  ]))
            ])));
  }
}
