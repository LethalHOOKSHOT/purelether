import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled3/text_styles/text_styles.dart';

import '../../painters/painters.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  const NoInternetConnection.expanded({super.key})
      : height = double.infinity,
        width = double.infinity;

  @override
  NoInternetConnectionState createState() => NoInternetConnectionState();
}

class NoInternetConnectionState extends State<NoInternetConnection> {
  bool isConnected = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _internet(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return (isConnected == true)
              ? const SizedBox.shrink()
              : Container(
                  width: widget.width,
                  height: widget.height,
                  color: Painters.warningMessageColor,
                  child: Center(
                    child: Text(
                      "no internet connection",
                      style: PressStart2PlayTextStyles.p2sGray,
                    ),
                  ),
                );
        });
  }

  Future<bool> _internet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      final res = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      setState(() {
        isConnected = res;
      });
      return res;
    } on SocketException catch (_) {
      setState(() {
        isConnected = false;
      });
    }
    return false;
  }
}
