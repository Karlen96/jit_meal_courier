import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../extensions/extensions.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets.dart';
import '../custom_toast_hook.dart';
import 'enums.dart';

class ToastDecoratorRounded extends HookWidget {
  final String text;
  final ToastMessageType messageType;
  final Border border;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const ToastDecoratorRounded({
    Key? key,
    required this.text,
    this.messageType = ToastMessageType.INFO,
    this.border = const Border(),
    this.margin = const EdgeInsets.only(
      bottom: 12,
      top: 12,
      left: 12,
      right: 6,
    ),
    this.padding = const EdgeInsets.fromLTRB(
      0,
      9,
      0,
      9,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toastController = useToastController();
    return SizedBox(
      width: context.width,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        width: context.width,
        child: Container(
          margin: margin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.white,
                  ),
                  child: notificationImage.png,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: context.theme.headline6.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () async {
                  await toastController.dismiss();
                },
                icon: Assets.close.png,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color get backgroundColor {
    switch (messageType) {
      case ToastMessageType.WELLDONE:
        return AppColors.green;
      case ToastMessageType.ERROR:
        return AppColors.red;
      case ToastMessageType.WARNING:
        return AppColors.orange;
      case ToastMessageType.INFO:
        return AppColors.blue;
      default:
        return AppColors.blue;
    }
  }

  String get title {
    switch (messageType) {
      case ToastMessageType.WELLDONE:
        return 'notificationTitles.wellDone'.tr();
      case ToastMessageType.ERROR:
        return 'notificationTitles.error'.tr();
      case ToastMessageType.WARNING:
        return 'notificationTitles.warning'.tr();
      case ToastMessageType.INFO:
        return 'notificationTitles.info'.tr();
      default:
        return 'notificationTitles.info'.tr();
    }
  }

  String get notificationImage {
    switch (messageType) {
      case ToastMessageType.WELLDONE:
        return Assets.wellDone;
      case ToastMessageType.ERROR:
        return Assets.error;
      case ToastMessageType.WARNING:
        return Assets.warning;
      case ToastMessageType.INFO:
        return Assets.info;
      default:
        return Assets.info;
    }
  }
}
