import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogDetails {
  static void Logging(String data) {
    debugPrint(data);
  }
}
class PermissionUtils {
  Future<bool> commandCameraPermissionStatus() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      return true;
    }
    return false;
  }

  Future<void> requestPermission() async {
    final permission = Permission.camera;

    if (await permission.isDenied) {
      PermissionStatus status = await permission.request();

        if (status == PermissionStatus.denied){
          openSettings();

        }
    }
  }

  void openSettings() async {
    await openAppSettings();
  }

  //ask for permission
  Future<bool> askForPermission() async {
    Map<Permission, PermissionStatus> status =
        await [Permission.camera].request();

    if (status[Permission.camera]!.isGranted) {
      return true;
    }
    return false;
  }
}
