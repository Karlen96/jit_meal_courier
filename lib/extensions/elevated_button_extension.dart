
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/button_colors_type.dart';
import '../constants/button_size_type.dart';
import '../themes/app_colors.dart';
import '../themes/app_fonts.dart';

extension ElevatedButtonHelper on ThemeData {
  ButtonStyle buttonStyle({
    ButtonSizes size = ButtonSizes.SMALL,
    ButtonColors color = ButtonColors.GREEN,
    TextStyle? style,
  }) {
    Color backgroundColor;
    Color overlayColor;
    Color disabledColor;
    EdgeInsets contentPadding;
    switch (size) {
      case ButtonSizes.SMALL:
        contentPadding = const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: kIsWeb ? 18 : 10,
        );
        break;
      case ButtonSizes.MEDIUM:
        contentPadding = const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: kIsWeb ? 14 : 5,
        );
        break;
      case ButtonSizes.BIG:
        contentPadding = const EdgeInsets.symmetric(
          horizontal: 29,
          vertical: kIsWeb ? 26.5 : 18.5,
        );
        break;
    }
    switch (color) {
      case ButtonColors.RED:
        backgroundColor = AppColors.red;
        disabledColor = AppColors.red.withOpacity(.5);
        overlayColor = AppColors.red1;
        break;
      case ButtonColors.GREEN:
        backgroundColor = AppColors.green;
        disabledColor = AppColors.green.withOpacity(.5);
        overlayColor = AppColors.green1;
        break;
      case ButtonColors.YELLOW:
        backgroundColor = AppColors.yellow;
        disabledColor = AppColors.yellow.withOpacity(.5);
        overlayColor = AppColors.yellow1;
        break;
      case ButtonColors.BLUE:
        backgroundColor = AppColors.blue;
        disabledColor = AppColors.blue.withOpacity(.5);
        overlayColor = AppColors.blue1;
        break;
      case ButtonColors.WHITE:
        backgroundColor = AppColors.white;
        disabledColor = AppColors.white.withOpacity(.5);
        overlayColor = AppColors.white;
        break;
    }
    return elevatedButtonTheme.style!.copyWith(
      foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.white.withOpacity(0.5)
              : AppColors.white;
        },
      ),
      padding: MaterialStateProperty.all(contentPadding),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        style ??
            const TextStyle(
              fontFamily: FontFamily.Roboto,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              height: 1.14,
            ),
      ),
      overlayColor: MaterialStateProperty.all(overlayColor),
      backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
          return states.contains(MaterialState.disabled)
              ? disabledColor
              : backgroundColor;
        },
      ),
    );
  }
}