import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/context_extension.dart';
import '../extensions/elevated_button_extension.dart';

class CustomButton extends HookWidget {
  const CustomButton({
    required this.child,
    Key? key,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.isDisabled = false,
    this.isExpanded = true,
    this.style,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final bool isDisabled;
  final bool isExpanded;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isLoading) {
      child = const CircularProgressIndicator.adaptive();
    } else {
      child = this.child;
    }
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        onLongPress: onLongPress,
        style: style ?? context.theme.buttonStyle(),
        child: child,
      ),
    );
  }
}
