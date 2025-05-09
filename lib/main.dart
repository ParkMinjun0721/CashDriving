import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cash_driving/theme/theme.dart';
import 'package:cash_driving/viewmodels/theme_controller.dart';
import 'package:tmap_ui_sdk/auth/data/auth_data.dart';
import 'package:tmap_ui_sdk/auth/data/init_result.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk_manager.dart';
import 'routes/app_routes.dart';

void main() {
  runApp( ProviderScope(child: CashDrivingApp()));
}

class CashDrivingApp extends ConsumerWidget {
  const CashDrivingApp({super.key});

  Future<void> init() async {
    try{
      //사용자 단말의 플랫폼 버전을 획득
      String? platformVersion = await TmapUiSdk().getPlatformVersion();

      //사용자 인증 입력
      AuthData authData = AuthData(
          clientApiKey: "5ngA4w0JDv7tRc46lfT653urs8useSyp1bmpjesM", // 필수
          userKey: "",
          clientServiceName: "",
          clientID: "",
          clientDeviceId: "",
          clientAppVersion: "",
          clientApCode: ""
      );

      //사용자 인증, 초기화
      InitResult? result = await TmapUISDKManager().initSDK(authData);

      if (platformVersion!=null && result!=null && result == InitResult.granted) {
        log("초기화 성공 : $platformVersion / $result");
      } else {
        log("초기화 실패 : $platformVersion / $result");
      }
    }catch(e){
      log("error ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider); // 테마 상태를 읽음
    final themeController = ref.read(themeProvider.notifier); // 테마 컨트롤러

    return MaterialApp(
      title: 'Cash Driving',
      theme: isLightTheme ? themeController.lightTheme : themeController.darkTheme, // 라이트/다크 테마
      darkTheme: themeController.darkTheme, // 다크 테마
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark, // 테마 모드
      initialRoute: '/',
      routes: AppRoutes.routes,
    );

  }
}
