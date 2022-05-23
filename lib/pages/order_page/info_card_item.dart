import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/extensions.dart';
import '../../themes/app_colors.dart';

class InfoCardItem extends HookWidget {
  final String title;
  final List<Widget> children;

  const InfoCardItem({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.lightGray,
      ),
      child: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              title,
              style: context.theme.caption2,
            ).paddingHorizontal(),
            const SizedBox(height: 16),
            const Divider(),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: SizedBox(
                width: context.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
