import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../constants/order_status.dart';
import '../../../extensions/extensions.dart';
import '../../../models/order_model/order_model.dart';
import '../../../themes/app_colors.dart';
import 'confirmed_action.dart';
import 'delivered_action.dart';
import 'in_progress_actions.dart';
import 'info_card_item.dart';

class OrderInfoActions extends HookWidget {
  final OrderModel order;

  const OrderInfoActions({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deliveredAt = useMemoized(
      //ignore: avoid_types_on_closure_parameters
      () {
        if (order.status == OrderStatus.DELIVERED) {
          final date = DateFormat('kk:mm').format(order.deliveredAt!);
          return '$date • ${order.status.title.tr()}';
        }
        return order.status.title.tr();
      },
      [0],
    );

    return InfoCardItem(
      title: 'orderScreen.status'.tr(),
      children: [
        const SizedBox(height: 16),
        Text(
          order.status.title.tr(),
          style: context.theme.headline6.copyWith(
            color: AppColors.green,
          ),
        ).paddingHorizontal(),
        if (order.status == OrderStatus.DELIVERED)
          Text(_deliveredAt, style: context.theme.bodyText1)
              .paddingHorizontal(),
        const SizedBox(height: 16),
        const Divider(),
        if (order.status == OrderStatus.DELIVERED) const DeliveredActions(),
        if (order.status == OrderStatus.IN_PROGRESS) const InProgressActions(),
        if (order.status == OrderStatus.CONFIRMED) const ConfirmedActions(),
        const Divider(),
      ],
    );
  }
}
