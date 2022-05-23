// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map json) => _$_OrderModel(
      id: json['id'] as int,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      orderProducts: (json['orderProducts'] as List<dynamic>?)
              ?.map((e) => OrderProductModel.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList() ??
          const <OrderProductModel>[],
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comment', instance.comment);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('deliveredAt', instance.deliveredAt?.toIso8601String());
  val['orderProducts'] = instance.orderProducts.map((e) => e.toJson()).toList();
  return val;
}

const _$OrderStatusEnumMap = {
  OrderStatus.IN_PROGRESS: 'IN_PROGRESS',
  OrderStatus.DELIVERED: 'DELIVERED',
  OrderStatus.DECLINED: 'DECLINED',
  OrderStatus.CONFIRMED: 'CONFIRMED',
};
