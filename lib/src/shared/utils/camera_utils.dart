import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

final class CameraUtils {
  const CameraUtils._();

  static Future<XFile?> takePicture() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    return image;
  }

  static Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    return image;
  }

  static String toBase64(String imagePath) {
    final bytes = File(imagePath).readAsBytesSync();
    //return base64 with header
    final extension = imagePath.split('.').last;
    return 'data:image/$extension;base64,${base64Encode(bytes)}';
  }
}
