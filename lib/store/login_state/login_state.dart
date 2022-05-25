import 'package:mobx/mobx.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  _LoginState() {
    setupValidations();
  }

  @observable
  String userName = '';
  @observable
  String password = '';

  @observable
  String? passwordError = '';

  List<ReactionDisposer>? _disposers;

  void setupValidations() {
    if (_disposers != null) {
      return;
    }
    _disposers = [
      reaction((_) => password, validatePassword),
    ];
  }

  void dispose() {
    if (_disposers == null) {
      return;
    }
    for (final d in _disposers!) {
      d();
    }
  }

  @action
  void validatePassword(_) {
    if (password.isEmpty) {
      passwordError = 'localValidationError.phone';
    } else {
      passwordError = null;
    }
  }
}
