import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../extensions/extensions.dart';
import '../../../models/order_model/order_model.dart';
import '../../../models/order_products_model/order_products_model.dart';
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
    final _getSubtitle = useCallback(
      //ignore: avoid_types_on_closure_parameters
      (OrderProductModel orderItem) {
        return '${orderItem.quantity.toStringAsFixed(2)} * ${orderItem.product.price!.toStringAsFixed(2)}';
      },
      [0],
    );

    final _onCall = useCallback(
      () async {
        final uri = Uri(
          scheme: 'tel',
          path: '+37488111111',
        );
        final res = await canLaunchUrl(uri);
        if (res) {
          await launchUrl(uri);
        }
      },
      [0],
    );

    return InfoCardItem(
      title: 'orderScreen.customer'.tr(),
      children: [
        const SizedBox(height: 16),
        Text(
          'Sam',
          style: context.theme.headline6,
        ).paddingHorizontal(),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: _onCall,
          child: Row(
            children: [
              const Icon(Icons.phone, size: 22),
              const SizedBox(width: 12),
              Text(
                '+37488111111',
                style: context.theme.headline6,
              ),
            ],
          ).paddingHorizontal(),
        ),
        const SizedBox(height: 16),
        const Divider(),
        for (var i = 0; i < order.orderProducts.length; i++)
          CustomListTile(
            title: order.orderProducts[i].product.name!,
            titleStyle: context.theme.caption2,
            trailing: order.orderProducts[i].product.price!.toStringAsFixed(2),
            trailingStyle: context.theme.bodyText1,
            subtitleStyle: context.theme.bodyText1.copyWith(
              color: AppColors.backgroundColor2,
            ),
            subtitle: _getSubtitle(order.orderProducts[i]),
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
