import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/filter_type.dart';
import '../../constants/order_status.dart';
import '../../extensions/extensions.dart';
import '../../hooks/loading_state_hook.dart';
import '../../models/order_model/order_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/dashboard_state/dashboard_state.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/drawer.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/orders_app_bar.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dashboardState = useMemoized(DashboardState.new);
    final _loadingState = useLoadingState();

    final _onChangeFilter = useCallback(
      //ignore: avoid_types_on_closure_parameters
      (FilterType? filterType) async {
        if (_dashboardState.currentFilter == filterType) {
          return;
        }
        _dashboardState.currentFilter = filterType;
        _loadingState.startLoading();
        await Future.delayed(const Duration(seconds: 2));
        await _dashboardState.initState();
        _loadingState.stopLoading();
      },
      [_dashboardState],
    );

    final _onRefresh = useCallback(
      () async {
        await Future.delayed(const Duration(seconds: 2));
        await _dashboardState.initState();
      },
      [_dashboardState],
    );

    final _initState = useCallback(
      () async {
        _loadingState.startLoading();
        await Future.delayed(const Duration(seconds: 2));
        await _dashboardState.initState();
        _loadingState.stopLoading();
      },
      [_dashboardState],
    );

    useEffect(() {
      _initState();
      return;
    });

    final _trailing = useCallback(
      //ignore: avoid_types_on_closure_parameters
      (OrderModel order) {
        if (order.status == OrderStatus.DELIVERED) {
          final date = DateFormat('kk:mm').format(order.deliveredAt!);
          return '$date • ${order.status.title.tr()}';
        }
        return order.status.title.tr();
      },
      [0],
    );

    return Scaffold(
      appBar: OrdersAppBar(
        onChangeFilter: _onChangeFilter,
      ),
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _onRefresh,
            color: AppColors.yellow,
            child: Observer(
              builder: (_) => ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: _dashboardState.orders.length,
                itemBuilder: (_, i) {
                  return CustomListTile(
                    onTap: () => router.push(
                      OrderRoute(orderId: _dashboardState.orders[i].id),
                    ),
                    titleStyle: context.theme.caption2,
                    title: '№${_dashboardState.orders[i].id}',
                    trailing: _trailing(_dashboardState.orders[i]),
                    trailingStyle: context.theme.caption2.copyWith(
                      color: AppColors.green,
                    ),
                  );
                },
              ),
            ),
          ),
          Observer(
            builder: (_) {
              if (_loadingState.isLoading) {
                return const LoadingWidget();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
