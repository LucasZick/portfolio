import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lucaszick/utils/app_routes.dart';
import 'package:lucaszick/providers/configs.dart';
import 'package:lucaszick/views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Configs(language: 'gb'),
      child: Consumer<Configs>(
        builder: (ctx, notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Zick's Portfolio",
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.orange,
                brightness: Brightness.light,
              ),
              fontFamily: 'Proxima Nova',
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.orange,
                accentColor: Colors.orange,
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
