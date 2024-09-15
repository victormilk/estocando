import 'package:estocando_flutter/src/app_navigator.dart';
import 'package:flutter/material.dart';

class CameraDialog extends StatelessWidget {
  const CameraDialog({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  final VoidCallback onCamera;
  final VoidCallback onGallery;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Escolha uma opção'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              leading: const Icon(Icons.camera),
              title: const Text('Câmera'),
              onTap: () async {
                navigator.goBack();
                onCamera.call();
              }),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(Icons.image),
            title: const Text('Galeria'),
            onTap: () async {
              navigator.goBack();
              onGallery.call();
            },
          ),
        ],
      ),
    );
  }
}
