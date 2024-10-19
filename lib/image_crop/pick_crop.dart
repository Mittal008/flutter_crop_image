import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

pickImage(BuildContext context) {
  XFile _pickedFile;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,S
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        onTap: () async {
          final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            _pickedFile = pickedFile;
            _cropImage(context, _pickedFile);
          }
        },
        title: const Text('Camera'),
      ),
      ListTile(
        onTap: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            _pickedFile = pickedFile;
            _cropImage(context, _pickedFile);
          }
        },
        title: const Text('Gallery'),
      ),
    ],
  );
}

_cropImage(BuildContext context, XFile pickedFile) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: pickedFile.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
        ],
      ),
      IOSUiSettings(
        title: 'Cropper',
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
        ],
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );

  if (croppedFile!.path.isNotEmpty) {
    // convert into File (XFile to File)
    File imageFile = File(croppedFile.path);

    Navigator.pop(context, imageFile);
  }
}
