import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants/order_status.dart';
import '../extensions/extensions.dart';
import '../models/order_model/order_model.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import '../themes/app_colors.dart';

class OrderItem extends HookWidget {
  final OrderModel order;

  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _onTab = useCallback(
      () {
        router.push(OrderRoute(orderId: order.id));
      },
      [0],
    );

    final _title = useMemoized(
      () {
        if (order.status == OrderStatus.DELIVERED) {
          final date = DateFormat('kk:mm').format(order.deliveredAt!);
          return '$date ➞ ${order.status.title.tr()}';
        }
        return order.status.title.tr();
      },
      [0],
    );

    return InkWell(
      onTap: _onTab,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '№${order.id}',
                style: context.theme.caption2,
              ),
              Row(
                children: [
                  Text(
                    _title,
                    style: context.theme.caption2.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              )
            ],
          ).paddingHorizontal(),
          const SizedBox(height: 12),
          const Divider()
        ],
      ),
    );
  }
}
