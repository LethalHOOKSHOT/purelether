import 'package:flutter/material.dart';
import 'package:untitled3/painters/painters.dart';

class SimpleButtonStyles {
  static final blueH50 = ButtonStyle(
    overlayColor: MaterialStateProperty.all(Painters.buttonColor["hover1"]!),
    minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
    backgroundColor: MaterialStateProperty.all(Painters.buttonColor["filled2"]!),
  );
  static final blue = ButtonStyle(
    overlayColor: MaterialStateProperty.all(Painters.buttonColor["hover1"]!),
    minimumSize: MaterialStateProperty.all(const Size(double.infinity, double.infinity)),
    backgroundColor: MaterialStateProperty.all(Painters.buttonColor["filled2"]!),

  );

  static final white = ButtonStyle(
      minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, double.infinity)),
      backgroundColor: MaterialStateProperty.all(Painters.buttonColor["empty"]),
      side: MaterialStateProperty.all(
          const BorderSide(color: Painters.borderSideColor, width: 2)),
      shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero)));

  static final black = ButtonStyle(
      minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, double.infinity)),
      backgroundColor: MaterialStateProperty.all(Painters.buttonColor["filled1"]),
      shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero)));
}
