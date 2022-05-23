import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/order_status.dart';
import '../order_products_model/order_products_model.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    required OrderStatus status,
    String? comment,
    DateTime? createdAt,
    DateTime? deliveredAt,
    @Default(<OrderProductModel>[]) List<OrderProductModel> orderProducts,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
