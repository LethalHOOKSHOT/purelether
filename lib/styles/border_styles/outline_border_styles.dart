import 'package:flutter/material.dart';
import 'package:untitled3/painters/painters.dart';

class BorderStyles {
  static var rectangleBlack = const OutlineInputBorder(
      borderSide: BorderSide(), borderRadius: BorderRadius.zero);

  static var rectangleRed = OutlineInputBorder(
      borderSide: BorderSide(color: Painters.boxColor[3]!),
      borderRadius: BorderRadius.zero);
  static final red = Border.all(color: Painters.boxColor[3]!);
}
