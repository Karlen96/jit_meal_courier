import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/extensions.dart';
import '../themes/app_colors.dart';

class CustomListTile extends HookWidget {
  final String title;
  final String trailing;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? trailingStyle;
  final TextStyle? subtitleStyle;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.trailing,
    this.titleStyle,
    this.trailingStyle,
    this.subtitleStyle,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: titleStyle ?? context.theme.bodyText2,
              ),
              Row(
                children: [
                  Text(
                    trailing,
                    style: trailingStyle ?? context.theme.bodyText2,
                  ),
                  if (onTap != null) const SizedBox(width: 4),
                  if (onTap != null) const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ],
          ).paddingHorizontal(),
          if (subtitle != null) const SizedBox(height: 2),
          if (subtitle != null)
            Text(
              subtitle!,
              style: subtitleStyle ??
                  context.theme.caption1.copyWith(
                    color: AppColors.backgroundColor2,
                  ),
            ).paddingHorizontal(),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }
}
