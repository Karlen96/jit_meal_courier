import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/extensions.dart';
import '../../models/order_model/order_model.dart';
import '../../widgets/order_item_details.dart';
import 'info_card_item.dart';

class OrderDetails extends HookWidget {
  final OrderModel order;

  const OrderDetails({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoCardItem(
      title: 'orderScreen.customer'.tr(),
      children: [
        const SizedBox(height: 16),
        Text(
          'Dmitry',
          style: context.theme.headline6,
        ).paddingHorizontal(),
        const SizedBox(height: 24),
        Row(
          children: const [
            Icon(Icons.phone),
            SizedBox(width: 12),
            Text('+37488111111'),
          ],
        ).paddingHorizontal(),
        for (var i = 0; i < order.orderProducts.length; i++)
          OrderItemDetails(
            order: order.orderProducts[i],
          ),
      ],
    );
  }
}
