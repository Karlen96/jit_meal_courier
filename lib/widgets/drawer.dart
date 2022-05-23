import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/extensions.dart';
import '../utils/assets.dart';

class DrawerWidget extends HookWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset(Assets.logo).paddingAll(12),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text('keywords.logout'.tr()),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
