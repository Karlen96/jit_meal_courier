import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../constants/filter_type.dart';
import '../../../extensions/extensions.dart';

class OrdersAppBar extends HookWidget with PreferredSizeWidget {
  final Function(FilterType?) onChangeFilter;

  const OrdersAppBar({
    Key? key,
    required this.onChangeFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _filterItems = useMemoized(() {
      return FilterType.values.map((value) {
        return DropdownMenuItem<FilterType>(
          value: value,
          child: Text(value.title.tr()),
        );
      }).toList();
    });

    return AppBar(
      title: Text(
        'dashboardScreen.orders'.tr(),
      ),
      elevation: 2,
      actions: [
        SizedBox(
          width: 100,
          height: 36,
          child: Center(
            child: DropdownButton<FilterType>(
              items: _filterItems,
              isExpanded: true,
              underline: const SizedBox(),
              icon: const SizedBox(),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.calendar_today_rounded),
                  SizedBox(width: 16)
                ],
              ),
              alignment: AlignmentDirectional.centerEnd,
              onChanged: onChangeFilter,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
