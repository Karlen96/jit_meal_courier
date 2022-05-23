import 'package:freezed_annotation/freezed_annotation.dart';

import '../product_model/product_model.dart';

part 'order_products_model.freezed.dart';

part 'order_products_model.g.dart';

@freezed
class OrderProductModel with _$OrderProductModel {
  const factory OrderProductModel({
    required ProductModel product,
    @Default(1) int quantity,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
}
