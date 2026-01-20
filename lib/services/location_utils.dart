// 요약: 권한 요청과 안내 다이얼로그를 제공하는 유틸입니다.
// - 위치 권한을 확인하고 필요 시 요청합니다.
// - 권한 거부 시 설정 화면 유도를 위한 다이얼로그를 띄웁니다.
// - 권한 획득 후 콜백으로 다음 동작을 이어줍니다.
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/simple_dialog.dart';

class LocationUtils {
  static Future<void> requestLocationPermission(BuildContext context,
      {required void Function() onGranted}) async {
    final ps = await _requestLocationPermission();
    if (ps != true) {
      if (context.mounted) {
        simpleDialog(
          context: context,
          titleText: '위치 권한이 필요 합니다.',
          rightButtonText: '권한 설정 하기',
          onRightBtnPressed: () async {
            final ps = await _requestLocationPermission();
            if (ps != true) {
              openAppSettings();
            } else {
              if (context.mounted) {
                onGranted();
                Navigator.pop(context);
              }
            }
          },
          shouldDismissOnTouchOutside: false,
        );
      }
    } else {
      onGranted();
    }
  }

  static Future<bool> _requestLocationPermission() async {
    var locationStatus = await Permission.locationWhenInUse.status;
    if (locationStatus.isDenied) {
      locationStatus = await Permission.locationWhenInUse.request();
    }
    return locationStatus.isGranted;
  }
}
