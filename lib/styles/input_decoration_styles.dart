import 'package:flutter/material.dart';

import '../text_styles/text_styles.dart';
import 'border_styles/border_styles.dart';

class InputDecorationStyles {
  static InputDecoration rectangleP2S(String label) => InputDecoration(
        label: Text(
          label,
          style: PressStart2PlayTextStyles.p2sFormStyle,
        ),
        enabledBorder: BorderStyles.rectangleBlack,
        focusedBorder: BorderStyles.rectangleBlack,
        errorBorder: BorderStyles.rectangleRed,
        focusedErrorBorder: BorderStyles.rectangleRed,
      );
}
