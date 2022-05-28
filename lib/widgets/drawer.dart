import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../extensions/extensions.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import '../store/auth/auth_state.dart';
import '../themes/app_colors.dart';
import '../utils/assets.dart';

class DrawerWidget extends HookWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _onLogOut = useCallback(
      () async {
        await GetIt.I<AuthState>().logout();
        await router.pushAndPopUntil(
          const LoginRoute(),
          predicate: (_) => false,
        );
      },
      [0],
    );

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(Assets.logo).paddingAll(20),
          ),
          Column(
            children: [
              Divider(color: AppColors.darkBlue40),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text('keywords.signOut'.tr()),
                onTap: _onLogOut,
              ),
            ],
          )
        ],
      ),
    );
  }
}
