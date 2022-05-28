import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'constants/flavor_type.dart';
import 'providers/get_it.dart';
import 'utils/assets.dart';

Future<void> run({Flavor env = Flavor.DEV}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();

  registerGetIt(env);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      startLocale: const Locale('ru', 'RU'),
      fallbackLocale: const Locale('ru', 'RU'),
      path: Assets.translations,
      child: const MyApp(),
    ),
  );
}

Future<void> main() async {
  await run();
}
