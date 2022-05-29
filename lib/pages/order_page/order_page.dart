import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../extensions/extensions.dart';
import '../../hooks/loading_state_hook.dart';
import '../../store/order_state/order_state.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/order_comment.dart';
import 'widgets/order_details.dart';
import 'widgets/order_info_actions.dart';

class OrderPage extends HookWidget {
  final int orderId;

  const OrderPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderState = useMemoized(OrderState.new);
    final _loadingState = useLoadingState();

    final initState = useCallback(
      () async {
        _loadingState.startLoading();
        await Future.delayed(const Duration(seconds: 2));
        await _orderState.getOrder(orderId: orderId);
        _loadingState.stopLoading();
      },
      [_orderState],
    );

    useEffect(() {
      initState();
      return;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('№$orderId'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: context.bottomPadding + 24),
            child: Observer(
              builder: (_) {
                if (_orderState.order != null) {
                  return Column(
                    children: [
                      OrderInfoActions(order: _orderState.order!),
                      OrderDetails(order: _orderState.order!),
                      if (_orderState.order!.comment != null)
                        OrderComments(
                          comment: _orderState.order!.comment!,
                        ),
                    ],
                  );
                }
                return const SizedBox();
              },
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
