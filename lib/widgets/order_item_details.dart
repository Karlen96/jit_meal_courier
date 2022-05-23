import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/order_products_model/order_products_model.dart';

class OrderItemDetails extends HookWidget {
  final OrderProductModel order;

  const OrderItemDetails({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(order.product.name!),
            Text('${order.product.price!}'),
          ],
        ),
        Text('${order.product.price! * order.quantity}'),
      ],
    );
  }
}
