
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'image_crop/select_image.dart';

void main() {
  runApp(const MyApp());
  checkPermission();
}

Future<bool?> checkPermission() async {
  if (Platform.isAndroid) {
    Map<Permission, PermissionStatus> statues = await [Permission.camera, Permission.photos].request();
    PermissionStatus? statusCamera = statues[Permission.camera];

    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted && statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      return true;
    }
    bool isPermanentlyDenied = statusCamera == PermissionStatus.permanentlyDenied || statusPhotos == PermissionStatus.permanentlyDenied;
    if (isPermanentlyDenied) {
      return false;
    }
  } else {
    Map<Permission, PermissionStatus> statues = await [Permission.camera, Permission.storage, Permission.photos].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    PermissionStatus? statusStorage = statues[Permission.storage];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted && statusStorage == PermissionStatus.granted && statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      return true;
    }
    bool isPermanentlyDenied = statusCamera == PermissionStatus.permanentlyDenied || statusStorage == PermissionStatus.permanentlyDenied || statusPhotos == PermissionStatus.permanentlyDenied;
    if (isPermanentlyDenied) {
      return false;
    }
  }
  return null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SelectImage(),
    );
  }
}

