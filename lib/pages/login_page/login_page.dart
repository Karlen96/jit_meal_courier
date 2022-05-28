import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/button_size_type.dart';
import '../../extensions/elevated_button_extension.dart';
import '../../extensions/extensions.dart';
import '../../hooks/toast_hook/custom_toast_hook.dart';
import '../../hooks/toast_hook/hook_widget/enums.dart';
import '../../hooks/toast_hook/hook_widget/toast_decorator_rounded_widget.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/login_state/login_state.dart';
import '../../utils/assets.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends HookWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _toastMessenger = useToastController();
    final _loginState = useMemoized(LoginState.new);

    final _onSignIn = useCallback(
      () async {
        try {
          await _loginState.onSignIn();
          await router.pushAndPopUntil(
            const DashboardRoute(),
            predicate: (_) => false,
          );
        } catch (e) {
          _toastMessenger.show(
            ToastDecoratorRounded(
              text: 'error.wrongLoginOrPassword'.tr(),
              messageType: ToastMessageType.ERROR,
            ),
            context,
          );
        }
      },
      [_loginState],
    );

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text('loginScreen.signIn'.tr()),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset(Assets.logo).paddingAll(36),
                const SizedBox(height: 24),
                TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    _loginState.userName = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'loginScreen.userName'.tr(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {
                    _loginState.password = value;
                  },
                  onSubmitted: (_) {
                    _onSignIn();
                  },
                  decoration: InputDecoration(
                    labelText: 'loginScreen.password'.tr(),
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  onPressed: _onSignIn,
                  style: context.theme.buttonStyle(size: ButtonSizes.MEDIUM),
                  child: Text('loginScreen.toComeIn'.tr()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
