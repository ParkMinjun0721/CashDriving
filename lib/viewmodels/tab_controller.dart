import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 0 = 주간, 1 = 월간, 2 = 전체
final selectedTabProvider = StateProvider<int>((ref) => 0);
