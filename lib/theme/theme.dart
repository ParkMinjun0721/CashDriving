/// File: font.dart
/// Purpose: Project의 전체 theme 관리
/// Author: 박민준
/// Created: 2024-12-28
/// Last Modified: 2024-12-30 by 박민준

import "package:flutter/material.dart";

/*
* 기존 방식
  class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
  이렇게 class 내에서 사전 선언 후

  color: customColors.primary,
  이런 식으로 사용.
  *
* Riverpod 이용 방식
  class MyHomePage extends ConsumerWidget {
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      final customColors = ref.watch(customColorsProvider); // CustomColors 가져오기

  backgroundColor: customColors.primary, // Custom Primary Color 사용

*
*/

// CustomColors 클래스 정의
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? primary;
  final Color? primary60;
  final Color? primary40;
  final Color? primary20;
  final Color? primary10;
  final Color? secondary;
  final Color? secondary60;
  final Color? success;
  final Color? success40;
  final Color? error;
  final Color? error40;
  final Color? neutral100;
  final Color? neutral90;
  final Color? neutral80;
  final Color? neutral60;
  final Color? neutral30;
  final Color? neutral0;
  final Color? black;
  final Color? white;


  CustomColors({
    required this.primary,
    required this.primary60,
    required this.primary40,
    required this.primary20,
    required this.primary10,
    required this.secondary,
    required this.secondary60,
    required this.success,
    required this.success40,
    required this.error,
    required this.error40,
    required this.neutral100,
    required this.neutral90,
    required this.neutral80,
    required this.neutral60,
    required this.neutral30,
    required this.neutral0,
    required this.black,
    required this.white,
  });

  @override
  CustomColors copyWith({
    Color? primary,
    Color? primary60,
    Color? primary40,
    Color? primary20,
    Color? primary10,
    Color? secondary,
    Color? secondary60,
    Color? success,
    Color? success40,
    Color? error40,
    Color? error,
    Color? neutral100,
    Color? neutral90,
    Color? neutral80,
    Color? neutral60,
    Color? neutral30,
    Color? neutral0,
    Color? black,
    Color? white,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      primary60: primary ?? this.primary60,
      primary40: primary ?? this.primary40,
      primary20: primary ?? this.primary20,
      primary10: primary ?? this.primary10,
      secondary: secondary ?? this.secondary,
      secondary60: secondary60 ?? this.secondary60,
      success: success ?? this.success,
      success40: success ?? this.success40,
      error: success ?? this.error,
      error40: success ?? this.error40,
      neutral100: neutral100 ?? this.neutral100,
      neutral90: neutral90 ?? this.neutral90,
      neutral80: neutral80 ?? this.neutral80,
      neutral60: neutral60 ?? this.neutral60,
      neutral30: neutral30 ?? this.neutral30,
      neutral0: neutral0 ?? this.neutral0,
      black: black ?? this.black,
      white: white ?? this.white,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      primary: Color.lerp(primary, other.primary, t),
      primary60: Color.lerp(primary60, other.primary60, t),
      primary40: Color.lerp(primary40, other.primary40, t),
      primary20: Color.lerp(primary20, other.primary20, t),
      primary10: Color.lerp(primary10, other.primary10, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      secondary60: Color.lerp(secondary60, other.secondary60, t),
      success: Color.lerp(success, other.success, t),
      success40: Color.lerp(success40, other.success40, t),
      error: Color.lerp(error, other.error, t),
      error40: Color.lerp(error40, other.error40, t),
      neutral100: Color.lerp(neutral100, other.neutral100, t),
      neutral90: Color.lerp(neutral90, other.neutral90, t),
      neutral80: Color.lerp(neutral80, other.neutral80, t),
      neutral60: Color.lerp(neutral60, other.neutral60, t),
      neutral30: Color.lerp(neutral30, other.neutral30, t),
      neutral0: Color.lerp(neutral0, other.neutral0, t),
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t),
    );
  }
}

// CustomColors 클래스 및 기타 정의는 그대로 유지
// 화면 베이스 흰색으로 설정 할 겸... 테마 정의 부분

final ThemeData lightThemeGlobal = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white, // 바탕화면을 흰색으로 설정
  colorScheme: ColorScheme.light(
    primary: Color(0xFF514FFF), // 기본 Primary 색상
    secondary: Color(0xFFFFD95C), // 기본 Secondary 색상
    background: Colors.white, // 배경 색상
    surface: Colors.white, // 서피스(카드 등) 색상
    onPrimary: Colors.white, // Primary 색상 위에 올려질 텍스트/아이콘 색상
    onSecondary: Colors.black, // Secondary 색상 위에 올려질 텍스트/아이콘 색상
    onBackground: Colors.black, // 배경색 위에 올려질 텍스트 색상
    onSurface: Colors.black, // 서피스 색상 위에 올려질 텍스트 색상
    error: Color(0xFFF05F42),
    errorContainer: Color(0xFFF05F42),
  ),
  extensions: <ThemeExtension>[
    CustomColors(
      primary: Color(0xFF514FFF),
      primary60: Color(0xFF8886FF),
      primary40: Color(0xFFB9B9FF),
      primary20: Color(0xFFD6D6FF),
      primary10: Color(0xFFE7E7FD),
      secondary: Color(0xFFFFD95C),
      secondary60: Color(0xFFFDE186),
      success: Color(0xFF3FA654),
      success40: Color(0xFFB2DBBB),
      error: Color(0xFFF05F42),
      error40: Color(0xFFF9BFB3),
      neutral100: Color(0xFFFFFFFF),
      neutral90: Color(0xFFF6F6F6),
      neutral80: Color(0xFFCDCED3),
      neutral60: Color(0xFF9099A0),
      neutral30: Color(0xFF434343),
      neutral0: Color(0xFF0A0A0A),
      white: Colors.white,
      black: Colors.black,
    ),
  ],
);

final ThemeData darkThemeGlobal = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF121212), // 다크 모드 배경 설정
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF514FFF), // 기본 Primary 색상
    secondary: Color(0xFFFFD95C), // 기본 Secondary 색상
    background: Color(0xFF121212), // 배경 색상
    surface: Color(0xFF1E1E1E), // 서피스(카드 등) 색상
    onPrimary: Colors.black, // Primary 색상 위에 올려질 텍스트/아이콘 색상
    onSecondary: Colors.white, // Secondary 색상 위에 올려질 텍스트/아이콘 색상
    onBackground: Colors.white, // 배경색 위에 올려질 텍스트 색상
    onSurface: Colors.white, // 서피스 색상 위에 올려질 텍스트 색상
    error: Color(0xFFF05F42),
    errorContainer: Color(0xFFF05F42),
  ),
  extensions: <ThemeExtension>[
    CustomColors(
      primary: Color(0xFF514FFF),
      primary60: Color(0xFF8886FF),
      primary40: Color(0xFFB9B9FF),
      primary20: Color(0xFFD6D6FF),
      primary10: Color(0xFFE7E7FD),
      secondary: Color(0xFFFFD95C),
      secondary60: Color(0xFFFDE186),
      success: Color(0xFF3FA654),
      success40: Color(0xFFB2DBBB),
      error: Color(0xFFF05F42),
      error40: Color(0xFFF9BFB3),
      neutral100: Color(0xFFFFFFFF),
      neutral90: Color(0xFFF6F6F6),
      neutral80: Color(0xFFCDCED3),
      neutral60: Color(0xFF9099A0),
      neutral30: Color(0xFF434343),
      neutral0: Color(0xFF0A0A0A),
      white: Colors.black, // 다크 모드에서는 흰색을 검은색으로
      black: Colors.white, // 다크 모드에서는 검은색을 흰색으로
    ),
  ],
);

