import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../extensions/extensions.dart';
import 'info_card_item.dart';

class OrderComments extends HookWidget {
  final String comment;

  const OrderComments({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoCardItem(
      title: 'orderScreen.comment'.tr(),
      children: [
        const SizedBox(height: 16),
        Text(comment).paddingHorizontal(),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}
