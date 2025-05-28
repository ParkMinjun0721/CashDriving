import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationController, int>((ref) {
  return NavigationController();
});

class NavigationController extends StateNotifier<int> {
  NavigationController() : super(0); // 초기값: 메인 페이지

  void setSelectedIndex(int index) {
    state = index;
  }

  void navigateToIndex(BuildContext context, int index) {
    setSelectedIndex(index);
    final route = _getRouteName(index);
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  String _getRouteName(int index) {
    switch (index) {
      case 0: return '/main';
      case 1: return '/dashboard';
      case 2: return '/mission';
      case 3: return '/shop';
      case 4: return '/mypage';
      default: return '/main';
    }
  }
}
