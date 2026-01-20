// 요약: 대시보드 탭 인덱스를 관리합니다.
// - 주간/월간/전체 탭 상태를 보관합니다.
// - 탭 전환 시 UI 갱신을 트리거합니다.
// - 간단한 상태 값만 관리하는 Provider입니다.
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 0 = 주간, 1 = 월간, 2 = 전체
final selectedTabProvider = StateProvider<int>((ref) => 0);
