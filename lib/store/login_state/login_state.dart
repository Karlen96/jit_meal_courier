import 'package:mobx/mobx.dart';

import '../../http/repositories/auth_repository.dart';
import '../../models/user_model/user_model.dart';
import '../../utils/storage_utils.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  String userName = '';
  @observable
  String password = '';

  @observable
  String? errorText;

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
