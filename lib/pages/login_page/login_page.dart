import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/button_size_type.dart';
import '../../extensions/elevated_button_extension.dart';
import '../../extensions/extensions.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../utils/assets.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends HookWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _onSignIn = useCallback(
      () {
        router.pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
      },
      [0],
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
                  decoration: InputDecoration(
                    labelText: 'loginScreen.userName'.tr(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
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
