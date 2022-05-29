import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/extensions.dart';
import '../themes/app_colors.dart';
import '../utils/color_utils.dart';

class LoadingWidget extends HookWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: brightnessColor(
          lightColor: AppColors.darkBlue,
          darkColor: AppColors.white,
        ),
      ),
      child: SizedBox(
        width: context.width,
        height: context.height,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.yellow,
          ),
        ),
      ),
    );
  }
}
