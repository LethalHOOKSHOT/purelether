import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/widgets/game_screen/health_bar/state.dart';
import '../../../model/props.dart';
import '../state.dart';

class HealthBarStored extends StatelessWidget {
  const HealthBarStored({Key? key, required this.id, required this.width})
      : super(key: key);
  final int id;
  final double width;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, List<Health>>(
        converter: (Store<GameState> store) => store.state.healthBars,
        builder: (context, healthBar) => Column(children: [
              showHeart(healthBar[id] >= maxHealthProp - 4, width),
              const Gap(4),
              showHeart(healthBar[id] >= maxHealthProp - 3, width),
              const Gap(4),
              showHeart(healthBar[id] >= maxHealthProp - 2, width),
              const Gap(4),
              showHeart(healthBar[id] >= maxHealthProp - 1, width),
              const Gap(4),
              showHeart(healthBar[id] >= maxHealthProp - 0, width)
            ]));
  }
}

Widget showHeart(bool isFull, double width) {
  if (isFull) {
    return Image.asset(
      "assets/img/heart.png",
      width: width,
      height: width,
    );
  } else {
    return Image.asset(
      "assets/img/heart_damaged.png",
      width: width,
      height: width,
    );
  }
}
