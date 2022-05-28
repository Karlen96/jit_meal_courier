import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/app_colors.dart';
import 'color_utils.dart';

///This file is automatically generated.
/// DO NOT EDIT, all your changes would be lost.
class Assets {
  Assets._();

  static const String translations = 'assets/translations';

  static const String logo = 'assets/images/logo.png';
  static const String error = 'assets/icons/error.png';
  static const String info = 'assets/icons/info.png';
  static const String wellDone = 'assets/icons/well_done.png';
  static const String warning = 'assets/icons/warning.png';
  static const String close = 'assets/icons/close.png';
}

extension AssetsHelper on String {
  SvgPicture svg({
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      color: color,
      height: height,
      width: width,
      fit: fit,
    );
  }

  Image get png => Image.asset(this);

  SvgPicture dynamicColoredSvg({
    Color lightColor = AppColors.white,
    Color darkColor = AppColors.backgroundColor2,
    bool invertColor = false,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      color: brightnessColor(
        lightColor: lightColor,
        darkColor: darkColor,
        invert: invertColor,
      ),
      height: height,
      width: width,
      fit: fit,
    );
  }
}
