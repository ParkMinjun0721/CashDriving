// 요약: 커스텀 컬러 확장을 제공하는 상태입니다.
// - 테마 확장 색상을 위젯에서 손쉽게 접근합니다.
// - 앱 전반의 색상 일관성을 보장합니다.
// - 테마 변경 시 자동으로 갱신됩니다.
/// File: custom_colors_provider.dart
/// Purpose: 앱의 테마에 따라 CustomColors를 제공하여 UI 색상 관리
/// Author: 박민준
/// Created: 2025-01-02
/// Last Modified: 2025-01-03 by 박민준

import 'package:example_tmap_navi/viewmodels/theme_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';

final customColorsProvider = Provider<CustomColors>((ref) {
  final isLightTheme = ref.watch(themeProvider); // true: Light, false: Dark
  final theme = isLightTheme ? lightThemeGlobal : darkThemeGlobal;

  // extensions에서 CustomColors 가져오기
  final customColors = theme.extensions[CustomColors] as CustomColors?;
  if (customColors == null) {
    throw Exception('CustomColors not found in ThemeData extensions.');
  }
  return customColors;
});
