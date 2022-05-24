import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../store/loading_state/loading_state.dart';

class _LoadingStateHookCreator {
  const _LoadingStateHookCreator();

  LoadingState call({List<Object?>? keys}) {
    return use(_LoadingStateHook(keys));
  }
}

const useLoadingState = _LoadingStateHookCreator();

class _LoadingStateHook extends Hook<LoadingState> {
  const _LoadingStateHook([
    List<Object?>? keys,
  ]) : super(keys: keys);

  @override
  _LoadingStateHookState createState() {
    return _LoadingStateHookState();
  }
}

class _LoadingStateHookState
    extends HookState<LoadingState, _LoadingStateHook> {
  late final _homeState = LoadingState();

  @override
  void initHook() {
    super.initHook();
  }

  @override
  LoadingState build(BuildContext context) => _homeState;

  @override
  String get debugLabel => 'useLoadingState';
}