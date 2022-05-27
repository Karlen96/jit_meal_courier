// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginState on _LoginState, Store {
  late final _$userNameAtom =
      Atom(name: '_LoginState.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_LoginState.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$onSignInAsyncAction =
      AsyncAction('_LoginState.onSignIn', context: context);

  @override
  Future<void> onSignIn() {
    return _$onSignInAsyncAction.run(() => super.onSignIn());
  }

  late final _$_LoginStateActionController =
      ActionController(name: '_LoginState', context: context);

  @override
  void validatePassword(dynamic _) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.validatePassword');
    try {
      return super.validatePassword(_);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
password: ${password},
passwordError: ${passwordError}
    ''';
  }
}
