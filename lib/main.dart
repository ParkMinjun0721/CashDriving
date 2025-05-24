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
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // flutterfire configure로 생성된 파일
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/login/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( ProviderScope(child: CashDrivingApp()));
}

class CashDrivingApp extends ConsumerWidget {
  const CashDrivingApp({super.key});

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
