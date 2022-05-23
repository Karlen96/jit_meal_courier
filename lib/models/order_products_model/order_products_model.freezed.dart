// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_products_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) {
  return _OrderProductModel.fromJson(json);
}

/// @nodoc
mixin _$OrderProductModel {
  ProductModel get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductModelCopyWith<OrderProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductModelCopyWith<$Res> {
  factory $OrderProductModelCopyWith(
          OrderProductModel value, $Res Function(OrderProductModel) then) =
      _$OrderProductModelCopyWithImpl<$Res>;
  $Res call({ProductModel product, int quantity});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._value, this._then);

  final OrderProductModel _value;
  // ignore: unused_field
  final $Res Function(OrderProductModel) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderProductModelCopyWith<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  factory _$$_OrderProductModelCopyWith(_$_OrderProductModel value,
          $Res Function(_$_OrderProductModel) then) =
      __$$_OrderProductModelCopyWithImpl<$Res>;
  @override
  $Res call({ProductModel product, int quantity});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$_OrderProductModelCopyWithImpl<$Res>
    extends _$OrderProductModelCopyWithImpl<$Res>
    implements _$$_OrderProductModelCopyWith<$Res> {
  __$$_OrderProductModelCopyWithImpl(
      _$_OrderProductModel _value, $Res Function(_$_OrderProductModel) _then)
      : super(_value, (v) => _then(v as _$_OrderProductModel));

  @override
  _$_OrderProductModel get _value => super._value as _$_OrderProductModel;

  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_OrderProductModel(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderProductModel implements _OrderProductModel {
  const _$_OrderProductModel({required this.product, this.quantity = 1});

  factory _$_OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderProductModelFromJson(json);

  @override
  final ProductModel product;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'OrderProductModel(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderProductModel &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_OrderProductModelCopyWith<_$_OrderProductModel> get copyWith =>
      __$$_OrderProductModelCopyWithImpl<_$_OrderProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderProductModelToJson(this);
  }
}

abstract class _OrderProductModel implements OrderProductModel {
  const factory _OrderProductModel(
      {required final ProductModel product,
      final int quantity}) = _$_OrderProductModel;

  factory _OrderProductModel.fromJson(Map<String, dynamic> json) =
      _$_OrderProductModel.fromJson;

  @override
  ProductModel get product => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderProductModelCopyWith<_$_OrderProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
