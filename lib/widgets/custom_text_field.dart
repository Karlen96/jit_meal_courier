import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/context_extension.dart';

class CustomTextField extends HookWidget {
  final bool autofocus;
  final bool obscureText;
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomTextField({
    Key? key,
    this.autofocus = false,
    this.obscureText = false,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      autofocus: autofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autocorrect: false,
      enableSuggestions: false,
      style: context.theme.headline6.copyWith(
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        helperText: '',
      ),
    );
  }
}
