import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/button_size_type.dart';
import '../../extensions/elevated_button_extension.dart';
import '../../extensions/extensions.dart';
import '../../hooks/loading_state_hook.dart';
import '../../hooks/toast_hook/custom_toast_hook.dart';
import '../../hooks/toast_hook/hook_widget/enums.dart';
import '../../hooks/toast_hook/hook_widget/toast_decorator_rounded_widget.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/login_state/login_state.dart';
import '../../utils/assets.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends HookWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _toastMessenger = useToastController();
    final _loadingState = useLoadingState();
    final _loginState = useMemoized(LoginState.new);

    final _onSignIn = useCallback(
      () async {
        try {
          _loadingState.startLoading();
          await _loginState.onSignIn();

          await router.pushAndPopUntil(
            const DashboardRoute(),
            predicate: (_) => false,
          );
        } catch (e) {
          _loginState.errorText = '';
          _toastMessenger.show(
            ToastDecoratorRounded(
              text: 'error.wrongLoginOrPassword'.tr(),
              messageType: ToastMessageType.ERROR,
            ),
            context,
          );
        } finally {
          _loadingState.stopLoading();
        }
      },
      [_loginState],
    );

    final _onValidate = useCallback(
      () {
        if (_loginState.userName.trim().isEmpty ||
            _loginState.password.trim().isEmpty ||
            _loginState.errorText != null) {
          return false;
        }
        return true;
      },
      [_loginState],
    );

    final _onChangeUserName = useCallback(
      (value) {
        _loginState
          ..userName = value
          ..errorText = null;
        _onValidate();
      },
      [_loginState],
    );

    final _onChangePassword = useCallback(
      (value) {
        _loginState
          ..password = value
          ..errorText = null;
        _onValidate();
      },
      [_loginState],
    );

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text('keywords.signIn'.tr()),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset(Assets.logo).paddingAll(36),
                const SizedBox(height: 24),
                Observer(
                  builder: (_) => CustomTextField(
                    autofocus: true,
                    keyboardType: TextInputType.visiblePassword,
                    errorText: _loginState.errorText,
                    textInputAction: TextInputAction.next,
                    onChanged: _onChangeUserName,
                    labelText: 'loginScreen.userName'.tr(),
                  ),
                ),
                Observer(
                  builder: (_) => CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    errorText: _loginState.errorText,
                    obscureText: true,
                    onChanged: _onChangePassword,
                    onSubmitted: (_) {
                      if (_onValidate()) {
                        _onSignIn();
                      }
                    },
                    labelText: 'loginScreen.password'.tr(),
                  ),
                ),
                Observer(
                  builder: (_) => CustomButton(
                    isLoading: _loadingState.isLoading,
                    onPressed: _onValidate() == true ? _onSignIn : null,
                    style: context.theme.buttonStyle(size: ButtonSizes.MEDIUM),
                    child: Text('keywords.toComeIn'.tr()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
