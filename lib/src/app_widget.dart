import 'package:estocando_flutter/src/app_navigator.dart';
import 'package:estocando_flutter/src/config/config.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: lightTheme,
      routerConfig: AppNavigator.router,
    );
  }
}
