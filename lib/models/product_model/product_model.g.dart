// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map json) => _$_ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      branchId: json['branchId'] as int?,
      productCategoryIds: json['productCategoryIds'] as int?,
      photoUrl: json['photoUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('price', instance.price);
  writeNotNull('discountedPrice', instance.discountedPrice);
  writeNotNull('branchId', instance.branchId);
  writeNotNull('productCategoryIds', instance.productCategoryIds);
  writeNotNull('photoUrl', instance.photoUrl);
  writeNotNull('description', instance.description);
  return val;
}
