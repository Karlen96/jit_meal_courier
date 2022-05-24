import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/extensions.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import '../themes/app_colors.dart';
import '../utils/assets.dart';

class DrawerWidget extends HookWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _onLogOut = useCallback(
      () {
        router.pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
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
                title: Text('keywords.logout'.tr()),
                onTap: _onLogOut,
              ),
            ],
          )
        ],
      ),
    );
  }
}
