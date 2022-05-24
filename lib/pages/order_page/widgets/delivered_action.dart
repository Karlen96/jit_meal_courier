import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../constants/button_colors_type.dart';
import '../../../constants/order_status.dart';
import '../../../extensions/elevated_button_extension.dart';
import '../../../extensions/extensions.dart';
import '../../../widgets/custom_button.dart';

class DeliveredActions extends HookWidget {
  const DeliveredActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {},
            style: context.theme.buttonStyle(color: ButtonColors.YELLOW),
            child: Text(OrderStatus.IN_PROGRESS.title.tr()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButton(
            onPressed: () {},
            child: Text(OrderStatus.DECLINED.title.tr()),
          ),
        ),
      ],
    ).paddingAll();
  }
}
