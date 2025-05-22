import "package:flutter/material.dart";

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
      primary60: primary60 ?? this.primary60,
      primary40: primary40 ?? this.primary40,
      primary20: primary20 ?? this.primary20,
      primary10: primary10 ?? this.primary10,
      secondary: secondary ?? this.secondary,
      secondary60: secondary60 ?? this.secondary60,
      success: success ?? this.success,
      success40: success40 ?? this.success40,
      error: error ?? this.error,
      error40: error40 ?? this.error40,
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
    if (other is! CustomColors) return this;
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

final ThemeData lightThemeGlobal = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Color(0xFF2196F3),
    secondary: Color(0xFFFFD95C),
    background: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
    error: Color(0xFFF05F42),
    errorContainer: Color(0xFFF05F42),
  ),
  extensions: <ThemeExtension>[
    CustomColors(
      primary: Color(0xFF2196F3),
      primary60: Color(0xFF64B5F6),
      primary40: Color(0xFFBBDEFB),
      primary20: Color(0xFFE3F2FD),
      primary10: Color(0xFFF1F9FF),
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
  scaffoldBackgroundColor: Color(0xFF121212),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF2196F3),
    secondary: Color(0xFFFFD95C),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
    error: Color(0xFFF05F42),
    errorContainer: Color(0xFFF05F42),
  ),
  extensions: <ThemeExtension>[
    CustomColors(
      primary: Color(0xFF2196F3),
      primary60: Color(0xFF64B5F6),
      primary40: Color(0xFFBBDEFB),
      primary20: Color(0xFFE3F2FD),
      primary10: Color(0xFFF1F9FF),
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
      white: Colors.black,
      black: Colors.white,
    ),
  ],
);
