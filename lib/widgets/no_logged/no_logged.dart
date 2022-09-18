import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled3/styles/button_styles/button_styles.dart';
import 'package:untitled3/text_styles/text_styles.dart';

class NoLogged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'You not logged',
        style: PressStart2PlayTextStyles.p2sBlack,
      ),
      content: Text(
        'You can login or continue playing',
        style: PressStart2PlayTextStyles.p2sBlack,
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pushNamed("/"),
          style: SimpleButtonStyles.blue,
          child: Text(
            "login",
            style: PressStart2PlayTextStyles.p2sBlack,
          ),
        )
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'You not logged',
              style: PressStart2PlayTextStyles.p2sBlack,
            ),
            content: Text(
              'You can login or continue playing',
              style: PressStart2PlayTextStyles.p2sBlack,
            ),
            actions: [
              OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed("/"),
                style: SimpleButtonStyles.blue,
                child: Text(
                  "login",
                  style: PressStart2PlayTextStyles.p2sBlack,
                ),
              )
            ],
          );
        });
  }
}


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
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'No logged',
                style: PressStart2PlayTextStyles.p2sBlack,
              ),
              const Gap(3),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                      onPressed: () => {Navigator.of(context).pushNamed("/")},
                      child: Text(
                        "login",
                        style: PressStart2PlayTextStyles.p2sBlack,
                      )),
                  const Gap(3),
                  OutlinedButton(
                      onPressed: () => {
                            setState(() {
                              _isDisabled = true;
                              _userWantContinue = true;
                            })
                          },
                      child: Text(
                        "continue",
                        style: PressStart2PlayTextStyles.p2sBlack,
                      ))
                ],
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
