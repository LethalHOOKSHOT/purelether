import 'package:flutter/material.dart';

class OutlineBorderStyles {
  static var rectangleBlack = const OutlineInputBorder(
      borderSide: BorderSide(), borderRadius: BorderRadius.zero);

  static var rectangleRed = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.zero);

}
