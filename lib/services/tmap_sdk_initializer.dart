import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tmap_ui_sdk/auth/data/auth_data.dart';
import 'package:tmap_ui_sdk/auth/data/init_result.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk_manager.dart';
import 'dart:developer';

import '../models/config_car_model.dart';
import 'location_utils.dart'; // LocationUtils 클래스 사용

final tmapSdkInitializedProvider = StateProvider<bool>((ref) => false);

class TmapSdkInitializer {
  static Future<void> initializeTmapSdk(BuildContext context, WidgetRef ref) async {
    try {
      log("✅ Tmap SDK 초기화 시작");

      // 위치 권한 확인 및 요청
      await LocationUtils.requestLocationPermission(context, onGranted: () async {
        log("✅ 위치 권한 허용됨");

        // 사용자 인증 입력
        AuthData authData = AuthData(
          clientApiKey: "E92uOVzW7Z4kqDlYqQv5R8SenadB2h4j2UZZwge8",
          userKey: "USER_KEY",
          clientServiceName: "CashDriving",
          clientID: "YOUR_CLIENT_ID",
          clientDeviceId: "YOUR_DEVICE_ID",
          clientAppVersion: "1.0.0",
          clientApCode: "YOUR_APP_CODE",
        );

        // SDK 초기화
        InitResult? result = await TmapUISDKManager().initSDK(authData);
        log("✅ Tmap SDK 초기화 결과: $result");

        if (result == InitResult.granted) {
          ref.read(tmapSdkInitializedProvider.notifier).state = true;
          log("✅ Tmap SDK 초기화 성공");
          await setCarConfig(); // 차량 설정 적용
        } else {
          log("❌ Tmap SDK 초기화 실패: $result");
        }
      });
    } catch (e, stackTrace) {
      log("🚨 Tmap SDK 초기화 에러: ${e.toString()}");
      log("StackTrace: $stackTrace");
    }
  }
}

Future<void> setCarConfig() async {
  try {
    ConfigCarModel model = ConfigCarModel();
    log("차량 설정 적용 시도: ${model.normalCar}");

    bool? result = await TmapUISDKManager().setConfigSDK(model.normalCar);
    if (result == true) {
      log("✅ 차량 설정 적용 완료");
    } else {
      log("❌ 차량 설정 적용 실패: SDK 초기화가 되어있지 않거나 설정 값이 잘못되었습니다.");
    }
  } catch (e, stackTrace) {
    log("🚨 차량 설정 오류: ${e.toString()}");
    log("StackTrace: $stackTrace");
  }
}
