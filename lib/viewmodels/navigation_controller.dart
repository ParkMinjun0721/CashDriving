/// File: navigation_controller.dart
/// Purpose: 앱의 네비게이션 상태를 관리하고 페이지 전환을 제어
/// Author: 박민준
/// Created: 2024-12-28
/// Last Modified: 2024-12-30 by 박민준

import 'package:cash_driving/views/point_shop/point_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/main/main_view.dart';
import '../views/mission/mission_view.dart';
import '../views/mypage/mypage_view.dart';

final navigationProvider = StateNotifierProvider<NavigationController, int>((ref) {
  return NavigationController();
});

class NavigationController extends StateNotifier<int> {
  NavigationController() : super(0); // 초기값: 0 (홈 화면)

  void setSelectedIndex(int index) {
    state = index; // 상태 업데이트
  }

  void navigateToIndex(BuildContext context, int index) {
    setSelectedIndex(index);
    switch (index) {
      case 0:
        _navigateWithoutAnimation(context, '/'); // Home
        break;
      case 1:
        _navigateWithoutAnimation(context, '/dashboard'); // Course
        break;
      case 2:
        _navigateWithoutAnimation(context, '/mission'); // Community
        break;
      case 3:
        _navigateWithoutAnimation(context, '/shop'); // Community
        break;
      case 4:
        _navigateWithoutAnimation(context, '/mypage'); // MyPage
        break;
    }
  }

  void _navigateWithoutAnimation(BuildContext context, String routeName) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => _getPageByRouteName(routeName),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
          (route) => false,
    );
  }

  Widget _getPageByRouteName(String routeName) {
    switch (routeName) {
      case '/':
        return const MainView();
      case '/mission':
        return MissionView();
      case '/dashboard':
        return DashboardView();
      case '/shop':
        return const PointShopView();
      case '/mypage':
        return const MyPageView();
      default:
        return const MainView();
    }
  }
}
