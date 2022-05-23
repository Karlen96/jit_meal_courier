// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderState on _OrderState, Store {
  late final _$orderAtom = Atom(name: '_OrderState.order', context: context);

  @override
  OrderModel? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderModel? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$getOrderAsyncAction =
      AsyncAction('_OrderState.getOrder', context: context);

  @override
  Future<void> getOrder({required int orderId}) {
    return _$getOrderAsyncAction.run(() => super.getOrder(orderId: orderId));
  }

  @override
  String toString() {
    return '''
order: ${order}
    ''';
  }
}
