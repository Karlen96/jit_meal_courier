import 'package:mobx/mobx.dart';

import '../../http/repositories/auth_repository.dart';
import '../../models/user_model/user_model.dart';
import '../../utils/storage_utils.dart';

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

  @action
  Future<void> onSignIn() async {
    final res = await AuthRepository.signIn(
      userModel: UserModel(
        userName: userName,
        password: password,
      ),
    );
    await StorageUtils.setAccessToken(res.accessToken);
  }
}
