import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/extensions.dart';
import 'hook_widget/toast_decorator_rounded_widget.dart';

ToastController useToastController() {
  return use(const _ToastUtilHook());
}

class _ToastUtilHook extends Hook<ToastController> {
  const _ToastUtilHook();

  @override
  _ToastUtilHookState createState() => _ToastUtilHookState();
}

class _ToastUtilHookState extends HookState<ToastController, _ToastUtilHook> {
  @override
  void initHook() {
    super.initHook();
  }

  @override
  ToastController build(BuildContext context) {
    return ToastController();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ToastController {
  void show(
    ToastDecoratorRounded toastDecorator,
    BuildContext context, {
    int duration = 5,
  }) {
    _ToastView()
      ..dismiss(withAnimation: false)
      ..createViewToast(context, duration, toastDecorator);
  }

  Future<void> dismiss() async {
    await _ToastView().dismiss();
  }
}

class _ToastView {
  static final _ToastView _singleton = _ToastView._internal();

  factory _ToastView() {
    return _singleton;
  }

  _ToastView._internal();

  static OverlayEntry? _overlayEntry;
  static AnimationController? _controller;

  Future<void> createViewToast(
    BuildContext context,
    int duration,
    ToastDecoratorRounded widget,
  ) async {
    _overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidgetAlternative(
        widget: widget,
        onClose: (controller) {
          _controller = controller;
        },
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
    await Future.delayed(Duration(seconds: duration));
    await dismiss();
  }

  Future<void> dismiss({bool withAnimation = true}) async {
    if (withAnimation) {
      await _controller?.reverse();
    }
    _overlayEntry?.remove();
    _overlayEntry = null;
    _controller = null;
  }
}

class _ToastWidgetAlternative extends HookWidget {
  const _ToastWidgetAlternative({
    Key? key,
    required this.widget,
    required this.onClose,
  }) : super(key: key);

  final Widget widget;
  final Function(AnimationController controller) onClose;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(
        milliseconds: 700,
      ),
      reverseDuration: const Duration(
        milliseconds: 200,
      ),
    );

    useEffect(
      () {
        controller.forward();
        onClose(controller);
        return;
      },
      [controller],
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Positioned(
        top: Tween<double>(
          begin: -100,
          end: context.topPadding,
        )
            .animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.bounceOut,
                reverseCurve: Curves.ease,
              ),
            )
            .value,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ),
      ),
    );
  }
}
