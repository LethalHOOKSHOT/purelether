import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled3/styles/border_styles/border_styles.dart';
import 'package:untitled3/styles/button_styles/button_styles.dart';
import 'package:untitled3/text_styles/text_styles.dart';

import '../../painters/painters.dart';

class NoLoggedWidget extends StatefulWidget {
  const NoLoggedWidget({Key? key, required this.isDisabled}) : super(key: key);
  final bool isDisabled;

  @override
  NoLoggedWidgetState createState() => NoLoggedWidgetState();
}

class NoLoggedWidgetState extends State<NoLoggedWidget>
    with SingleTickerProviderStateMixin {
  bool _isDisabled = true;
  bool _userWantContinue = false;

  @override
  @override
  Widget build(BuildContext context) {
    setState(() {
      _isDisabled = widget.isDisabled;
    });
    return (!_isDisabled && !_userWantContinue)
        ? Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: BorderStyles.red,
                color: Painters.alarmTextBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Not logged',
                        style: PressStart2PlayTextStyles.p2sBlack,
                      ),
                    ),
                  ),
                  const Gap(6),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: OutlinedButton(
                          onPressed: () =>
                              {Navigator.of(context).pushNamed("/")},
                          style: SimpleButtonStyles.blueH50,
                          child: FittedBox(
                              child: Text(
                            "login",
                            style: PressStart2PlayTextStyles.p2sBlack,
                          )),
                        )),
                        const Gap(3),
                        Expanded(
                            child: OutlinedButton(
                                style: SimpleButtonStyles.blueH50,
                                onPressed: () => {
                                      setState(() {
                                        _isDisabled = true;
                                        _userWantContinue = true;
                                      })
                                    },
                                child: FittedBox(
                                  child: Text(
                                    "skip",
                                    style: PressStart2PlayTextStyles.p2sBlack,
                                  ),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            ))
        : const SizedBox.shrink();
  }
}
