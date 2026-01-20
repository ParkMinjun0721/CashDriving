// 요약: 테마 모드(라이트/다크) 선택 상태를 관리합니다.
// - 현재 테마 모드 상태를 전역으로 노출합니다.
// - 사용자 설정에 따라 테마 전환을 지원합니다.
// - 테마 토글 UI와 연동할 수 있습니다.
/// File: theme_controller.dart
/// Purpose: 앱의 테마 상태를 관리하고 라이트 및 다크 테마를 제공
/// Author: 박민준
/// Created: 2024-12-28
/// Last Modified: 2024-12-30 by 박민준

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/theme.dart';

final themeProvider = StateNotifierProvider<ThemeController, bool>((ref) {
  return ThemeController();
});

class ThemeController extends StateNotifier<bool> {
  ThemeController() : super(true); // true: Light Theme, false: Dark Theme

  ThemeData get lightTheme => lightThemeGlobal; // 라이트 테마 가져오기
  ThemeData get darkTheme => darkThemeGlobal; // 다크 테마 가져오기

  ThemeMode get themeMode => state ? ThemeMode.light : ThemeMode.dark; // 현재 테마 모드

  void toggleTheme() {
    state = !state; // 테마 전환
  }
}
