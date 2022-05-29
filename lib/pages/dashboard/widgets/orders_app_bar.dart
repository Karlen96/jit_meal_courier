import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../constants/filter_type.dart';
import '../../../extensions/extensions.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/color_utils.dart';

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
        return PopupMenuItem<FilterType>(
          value: value,
          child: Text(value.title.tr()),
        );
      }).toList();
    });

    return AppBar(
      title: Text(
        'dashboardScreen.orders'.tr(),
      ),
      actions: [
        PopupMenuButton<FilterType>(
          color: brightnessColor(
            lightColor: AppColors.darkBlue,
            darkColor: AppColors.white,
          ),
          onSelected: onChangeFilter,
          itemBuilder: (_) => _filterItems,
          elevation: 1,
          child: const Icon(Icons.calendar_today_rounded),
        ),
        const SizedBox(width: 16)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
