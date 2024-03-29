import 'package:lucaszick/utils/random_color.dart';
import 'package:universal_io/io.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lucaszick/utils/app_routes.dart';
import 'package:lucaszick/providers/configs.dart';
import 'package:lucaszick/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  String localeName = Platform.localeName;
  List suportedLocales = const [
    Locale('en', 'US'),
    Locale('de', 'DE'),
    Locale('pt', 'BR'),
  ];
  Locale actualLocale =
      Locale(localeName.substring(0, 2), localeName.substring(3, 5));
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('de', 'DE'),
      Locale('pt', 'BR'),
    ],
    startLocale: suportedLocales.contains(actualLocale)
        ? actualLocale
        : const Locale("en", "US"),
    fallbackLocale: const Locale("en", "US"),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Configs(),
      child: Consumer<Configs>(
        builder: (ctx, notifier, child) {
          return MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            title: "Lucas Zick",
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: RandomColor.getRandomColor(),
                brightness: Brightness.light,
              ),
              fontFamily: 'Proxima Nova',
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: RandomColor.getRandomColor(),
                brightness: Brightness.dark,
              ),
              fontFamily: 'Proxima Nova',
            ),
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            initialRoute: AppRoutes.home,
            routes: {AppRoutes.home: (ctx) => const HomePage()},
          );
        },
      ),
    );
  }
}
