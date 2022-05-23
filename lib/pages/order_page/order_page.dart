import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../store/loading_state/loading_state.dart';
import '../../store/order_state/order_state.dart';
import '../../widgets/loading_widget.dart';
import 'order_comment.dart';
import 'order_details.dart';
import 'order_info_actions.dart';

class OrderPage extends HookWidget {
  final int orderId;

  const OrderPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderState = useMemoized(OrderState.new);
    final _loadingState = useMemoized(LoadingState.new);

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
        elevation: 2,
        title: Text('№$orderId'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Observer(
              builder: (_) => _orderState.order != null
                  ? Column(
                      children: [
                        OrderInfoActions(order: _orderState.order!),
                        OrderDetails(order: _orderState.order!),
                        if (_orderState.order!.comment != null)
                          OrderComments(
                            comment: _orderState.order!.comment!,
                          ),
                      ],
                    )
                  : const SizedBox(),
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
