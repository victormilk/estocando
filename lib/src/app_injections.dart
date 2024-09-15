import 'package:estocando_flutter/src/shared/di/injector.dart';
import 'package:estocando_flutter/src/shared/managers/camera/camera_controller.dart';

final class AppInjections {
  const AppInjections._();

  static void initialize() {
    injector.registerLazySingleton<CameraController>(() => CameraController());
    _initItems();
  }

  static void _initItems() {}
}
