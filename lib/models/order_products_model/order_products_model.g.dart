// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderProductModel _$$_OrderProductModelFromJson(Map json) =>
    _$_OrderProductModel(
      product: ProductModel.fromJson(
          Map<String, dynamic>.from(json['product'] as Map)),
      quantity: json['quantity'] as int? ?? 1,
    );

Map<String, dynamic> _$$_OrderProductModelToJson(
        _$_OrderProductModel instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
    };
