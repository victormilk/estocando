import 'package:estocando_flutter/src/app_injections.dart';
import 'package:estocando_flutter/src/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  AppInjections.initialize();
  runApp(const AppWidget());
}
