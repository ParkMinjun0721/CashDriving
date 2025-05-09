/// 파일: box_shadow_styles.dart
/// 목적: drop shadow component
/// 작성자: 강희
/// 생성일: 2024-01-03
/// 마지막 수정: 2025-01-03 by 강희

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../theme/theme.dart'; // theme.dart가 올바르게 임포트되었는지 확인하세요.

/*
사용법:
- boxShadow: BoxShadowStyles.shadow1(context), // 이렇게 정의된 그림자 스타일을 위젯에 적용할 수 있습니다.

- 위젯의 decoration에서 사용 예시:
decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // 현재 테마의 primary 색상을 사용
            boxShadow: BoxShadowStyles.shadow1(context), // 첫 번째 그림자 스타일을 적용
          ),
 */

class BoxShadowStyles {
  // 첫 번째 그림자 스타일을 제공하는 함수입니다. BuildContext를 받아 현재 테마를 접근합니다.
  static List<BoxShadow> shadow1(BuildContext context) {
    // 현재 테마에서 CustomColors 확장을 가져옵니다.
    final customColors = Theme.of(context).extension<CustomColors>();

    // customColors가 null일 경우 기본값을 제공
    final neutral80 = customColors?.neutral80 ?? Colors.grey;

    return [
      // 첫 번째 BoxShadow 정의
      BoxShadow(
        color: neutral80, // 그림자 색상 (기본값 사용)
        blurRadius: 2, // 그림자의 흐림 정도
        offset: Offset(0, 0), // 오프셋 없음 (그림자가 요소 바로 아래에 위치)
        spreadRadius: 0, // 확산 없음 (그림자 크기 변화 없음)
      ),
      // 두 번째 BoxShadow 정의 (약간의 오프셋 추가)
      BoxShadow(
        color: neutral80, // 그림자 색상 (기본값 사용)
        blurRadius: 2, // 그림자의 흐림 정도
        offset: Offset(0, 1), // 세로로 살짝 내려간 오프셋
        spreadRadius: 0, // 확산 없음
      ),
    ];
  }


  // 두 번째 그림자 스타일을 제공하는 함수입니다. 더 강렬한 효과를 가집니다.
  static List<BoxShadow> shadow2(BuildContext context) {
    // 현재 테마에서 CustomColors 확장을 가져옵니다.
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return [
      // 첫 번째 BoxShadow 정의 (더 큰 흐림과 세로 오프셋)
      BoxShadow(
        color: customColors.neutral80!, // 테마에서 정의한 그림자 색상
        blurRadius: 8, // 더 큰 흐림 효과
        offset: Offset(0, 4), // 세로로 4만큼 내려가는 오프셋
        spreadRadius: 0, // 확산 없음
      ),
      // 두 번째 BoxShadow 정의 (작은 흐림과 오프셋 없음)
      BoxShadow(
        color: customColors.neutral80!, // 테마에서 정의한 그림자 색상
        blurRadius: 2, // 작은 흐림 효과
        offset: Offset(0, 0), // 오프셋 없음 (그림자가 요소 바로 아래에 위치)
        spreadRadius: 0, // 확산 없음
      ),
    ];
  }
}
