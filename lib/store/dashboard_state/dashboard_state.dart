import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../constants/filter_type.dart';
import '../../constants/order_status.dart';
import '../../models/order_model/order_model.dart';

part 'dashboard_state.g.dart';

class DashboardState = _DashboardState with _$DashboardState;

abstract class _DashboardState with Store {
  @observable
  FilterType? currentFilter = FilterType.TODAY;

  @observable
  ObservableList<OrderModel> orders = ObservableList<OrderModel>();

  @action
  Future<void> initState() async {
    final random = Random();
    final date = DateTime.now();
    final generateData = List.generate(
      random.nextInt(20) + 1,
      (i) => OrderModel(
        id: i,
        status: OrderStatus.values[random.nextInt(OrderStatus.values.length)],
        deliveredAt: date,
      ),
    );
    orders = generateData.asObservable();
  }
}
