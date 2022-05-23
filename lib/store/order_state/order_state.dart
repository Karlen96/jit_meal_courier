import 'package:mobx/mobx.dart';

import '../../constants/order_status.dart';
import '../../models/order_model/order_model.dart';
import '../../models/order_products_model/order_products_model.dart';
import '../../models/product_model/product_model.dart';

part 'order_state.g.dart';

class OrderState = _OrderState with _$OrderState;

abstract class _OrderState with Store {
  @observable
  OrderModel? order;

  @action
  Future<void> getOrder({required int orderId}) async {
    final generateOrder = OrderModel(
      id: orderId,
      status: OrderStatus.DELIVERED,
      orderProducts: List.generate(
        10,
        (i) => OrderProductModel(
          product: ProductModel(
            name: 'product$i',
            price: 200,
          ),
        ),
      ),
    );
    order = generateOrder;
  }
}
