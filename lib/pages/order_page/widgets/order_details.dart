import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../extensions/extensions.dart';
import '../../../models/order_model/order_model.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/custom_list_tile.dart';
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
          'Sam',
          style: context.theme.headline6,
        ).paddingHorizontal(),
        const SizedBox(height: 24),
        Row(
          children: [
            const Icon(Icons.phone, size: 14),
            const SizedBox(width: 12),
            Text(
              '+37488111111',
              style: context.theme.bodyText1,
            ),
          ],
        ).paddingHorizontal(),
        const SizedBox(height: 16),
        const Divider(),
        for (var i = 0; i < order.orderProducts.length; i++)
          CustomListTile(
            title: order.orderProducts[i].product.name!,
            titleStyle: context.theme.caption2,
            trailing: order.orderProducts[i].product.price!.toStringAsFixed(2),
            subtitleStyle: context.theme.bodyText1.copyWith(
              color: AppColors.backgroundColor2,
            ),
            subtitle:
                '${order.orderProducts[i].quantity.toStringAsFixed(2)} * ${order.orderProducts[i].product.price!.toStringAsFixed(2)}',
          ),
        CustomListTile(
          title: 'orderScreen.amount'.tr(),
          trailing: 200.toStringAsFixed(2),
        ),
        CustomListTile(
          title: 'orderScreen.discount'.tr(),
          trailing: 10.toStringAsFixed(2),
        ),
        CustomListTile(
          title: 'orderScreen.prepayment'.tr(),
          trailing: 10.toStringAsFixed(2),
        ),
        CustomListTile(
          title: 'orderScreen.totalForPayment'.tr(),
          titleStyle: context.theme.caption2,
          trailingStyle: context.theme.caption2,
          trailing: 180.toStringAsFixed(2),
        ),
      ],
    );
  }
}
