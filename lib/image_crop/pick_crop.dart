import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../main.dart';

pickImage(BuildContext context) {
  XFile pickImageFile;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        onTap: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            pickImageFile = pickedFile;
            _cropImage(pickImageFile);
          }
        },
        title: const Text('Camera'),
      ),
      ListTile(
        onTap: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            pickImageFile = pickedFile;
            _cropImage(pickImageFile);
          }
        },
        title: const Text('Gallery'),
      ),
    ],
  );
}

_cropImage(XFile pickedFile) async {
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
        context: getContext,
      ),
    ],
  );

  if (croppedFile!.path.isNotEmpty) {

    // convert into File (XFile to File)
    File imageFile = File(croppedFile.path);
    Navigator.pop(getContext, imageFile);
  }
}
