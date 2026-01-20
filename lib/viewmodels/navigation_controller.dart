// 요약: 하단 탭 이동을 제어하는 네비게이션 컨트롤러입니다.
// - 탭 인덱스에 따라 라우팅을 수행합니다.
// - 현재 탭과 중복 이동을 방지합니다.
// - GoRouter 기반 이동 흐름을 캡슐화합니다.
/// File: navigation_controller.dart
/// Purpose: 앱의 네비게이션 상태를 관리하고 GoRouter 기반 페이지 전환을 제어
/// Author: 박민준
/// Created: 2024-12-28
/// Last Modified: 2025-05-29 by ChatGPT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

final navigationProvider = StateNotifierProvider<NavigationController, int>((ref) {
  return NavigationController();
});

class NavigationController extends StateNotifier<int> {
  NavigationController() : super(0); // 초기값: Home

  void setSelectedIndex(int index) {
    state = index;
  }

  void navigateToIndex(BuildContext context, int index) {
    if (index == state) return; // 중복 이동 방지

    setSelectedIndex(index);
    switch (index) {
      case 0:
        context.go(AppRoutes.main);
        break;
      case 1:
        context.go(AppRoutes.dashboard);
        break;
      case 2:
        context.go(AppRoutes.mission);
        break;
      case 3:
        context.go(AppRoutes.shop);
        break;
      case 4:
        context.go(AppRoutes.mypage);
        break;
    }
  }
}