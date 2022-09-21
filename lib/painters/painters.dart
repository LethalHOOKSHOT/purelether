import 'package:flutter/material.dart';

class MyGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path background = Path();
    paint.color = const Color(0xFFD5DEF0);
    background.addRect(Rect.fromLTRB(0, 0, width, height));
    canvas.drawPath(background, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class Painters {
  static const alertText = Colors.red;
  static const formText = Color(0x50000000);
  static const alarmTextBackgroundColor = Color(0xFFe0e0e0);
  static const gradientColor1 = Color(0xFFFFFFFF);
  static const gradientColor2 = Color(0xC5D1EAFF);
  static const winIconColor = Colors.green;
  static const loseIconColor = Colors.red;
  static const drawIconColor = Colors.blue;
  static const radioButtonColor1 = Color(0xFF1C79CE);
  static const radioButtonColor2 = Color(0xFFF5F5F5);
  static const nextTextColor = ColorSwatch<int>(_textPrimaryColor,
      <int, Color>{2: Colors.black, 3: Colors.white, 4: Colors.grey});
  static const int _textPrimaryColor = 0xFF161616;

  static const int _buttonPrimaryColor = 0xFF1C79CE;
  static final buttonColor =
      ColorSwatch<String>(_buttonPrimaryColor, <String, Color>{
    "empty": const Color(0xFFF5F5F5),
    "filled1": const Color(0xFF000000),
    "hover1": Colors.blue.shade100,
    "filled2": Colors.blue.shade300,
    "disable1": const Color(0x5D000000)
  });

  static const int _primaryBorderColor = 0xFF161616;
  static const borderSideColor =
      ColorSwatch<String>(_primaryBorderColor, <String, Color>{
    "filled2": Color(0xFF1C79CE),
    "filled1": Color(0xFF000000),
    "disable1": Color(0x5D000000)
  });

  static const screenBackgroundColor =
      ColorSwatch<int>(_screenBackgroundPrimaryColor, <int, Color>{});
  static const int _screenBackgroundPrimaryColor = 0xFFF5F5F5;

  static const boxColor = ColorSwatch<int>(
      _boxPrimaryColor, <int, Color>{2: Color(0xFFC5D1EA), 3: Colors.red});
  static const int _boxPrimaryColor = 0xFF1C79CE;

  static const warningMessageColor = Color(0x779E9E9E);
}
