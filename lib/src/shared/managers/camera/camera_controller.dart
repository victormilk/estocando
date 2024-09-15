import 'package:estocando_flutter/src/shared/managers/base_controller.dart';
import 'package:estocando_flutter/src/shared/managers/camera/camera_state.dart';
import 'package:estocando_flutter/src/shared/utils/camera_utils.dart';

typedef ImageCallback = void Function(String imagePath);

final class CameraController extends BaseController<CameraState> {
  CameraController() : super(const CameraState());

  Future<void> takePicture({ImageCallback? onSuccess}) async {
    emit(state.copyWith(status: CameraStateStatus.loading));

    try {
      final image = await CameraUtils.takePicture();
      if (image != null) {
        emit(state.copyWith(
          status: CameraStateStatus.success,
          imagePath: image.path,
        ));
        onSuccess?.call(image.path);
      } else {
        emit(state.copyWith(
          status: CameraStateStatus.success,
          clearImagePath: true,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: CameraStateStatus.error));
    }
  }

  Future<void> pickImage({ImageCallback? onSuccess}) async {
    emit(state.copyWith(status: CameraStateStatus.loading));

    try {
      final image = await CameraUtils.pickImage();
      if (image != null) {
        emit(state.copyWith(
          status: CameraStateStatus.success,
          imagePath: image.path,
        ));
        onSuccess?.call(image.path);
      } else {
        emit(state.copyWith(
          status: CameraStateStatus.success,
          clearImagePath: true,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: CameraStateStatus.error));
    }
  }

  void reset() {
    emit(const CameraState());
  }
}
