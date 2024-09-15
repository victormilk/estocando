import 'package:estocando_flutter/src/shared/managers/base_state.dart';

enum CameraStateStatus { initial, loading, success, error }

final class CameraState extends BaseState {
  final CameraStateStatus status;
  final String? imagePath;

  const CameraState({
    this.status = CameraStateStatus.initial,
    this.imagePath,
  });

  CameraState copyWith({
    CameraStateStatus? status,
    String? imagePath,
    bool clearImagePath = false,
  }) {
    return CameraState(
      status: status ?? this.status,
      imagePath: clearImagePath ? null : imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [status, imagePath];
}
