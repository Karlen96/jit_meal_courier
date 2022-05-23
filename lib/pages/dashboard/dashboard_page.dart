import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../constants/filter_type.dart';
import '../../store/dashboard_state/dashboard_state.dart';
import '../../store/loading_state/loading_state.dart';
import '../../themes/app_colors.dart';
import '../../widgets/drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/order_item.dart';
import 'widgets/orders_app_bar.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dashboardState = useMemoized(DashboardState.new);
    final _loadingState = useMemoized(LoadingState.new);

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
                itemCount: _dashboardState.orders.length,
                itemBuilder: (_, i) {
                  return OrderItem(
                    order: _dashboardState.orders[i],
                  );
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => _loadingState.isLoading
                ? const LoadingWidget()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
