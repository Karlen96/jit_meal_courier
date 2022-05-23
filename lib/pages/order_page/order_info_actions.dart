import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/order_status.dart';
import '../../extensions/extensions.dart';
import '../../models/order_model/order_model.dart';
import '../../themes/app_colors.dart';
import 'info_card_item.dart';

class OrderInfoActions extends HookWidget {
  final OrderModel order;

  const OrderInfoActions({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoCardItem(
      title: 'orderScreen.status'.tr(),
      children: [
        const SizedBox(height: 16),
        Text(
          order.status.title.tr(),
          style: context.theme.caption2.copyWith(
            color: AppColors.green,
          ),
        ).paddingHorizontal(),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}
