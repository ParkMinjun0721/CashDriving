// 요약: GoRouter 라우팅 테이블을 정의합니다.
// - 앱 전반의 경로 상수를 제공합니다.
// - 각 라우트에 대응하는 화면 위젯을 매핑합니다.
// - 초기 진입 경로와 라우팅 흐름을 설정합니다.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/login/login_view.dart';
import '../views/main/main_view.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/point_shop/point_shop_view.dart';
import '../views/mission/mission_view.dart';
import '../views/driving/driving_map_view.dart';
import '../views/driving/driving_report_view.dart';
import '../views/mypage/mypage_view.dart';

import '../pages/root/root_page.dart';
import '../pages/drive/drive_page.dart';
import '../pages/location/location_picker_page.dart';
import '../pages/drive/trip_summary_view.dart';


class AppRoutes {
  static const login = '/login';
  static const rootPage = '/root';
  static const main = '/';
  static const dashboard = '/dashboard';
  static const shop = '/shop';
  static const mission = '/mission';
  static const report = '/report';
  static const mypage = '/mypage';
  static const driving = '/driving';

  static const drivePage = '/root/drive';
  static const locationStart = '/root/location/start';
  static const locationDestination = '/root/location/destination';
  static const tripSummary = '/tripSummary';
}

GoRouter router() {
  return GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.rootPage,
        builder: (_, __) => const RootPage(),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (_, __) => const MainView(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (_, __) => const DashboardView(),
      ),
      GoRoute(
        path: AppRoutes.shop,
        builder: (_, __) => const PointShopView(),
      ),
      GoRoute(
        path: AppRoutes.mission,
        builder: (_, __) => const MissionView(),
      ),
      GoRoute(
        path: AppRoutes.report,
        builder: (_, __) => const ReportView(),
      ),
      GoRoute(
        path: AppRoutes.mypage,
        builder: (_, __) => const MyPageView(),
      ),
      GoRoute(
        path: AppRoutes.driving,
        builder: (_, __) => const DrivingMapView(),
      ),
      GoRoute(
        path: AppRoutes.drivePage,
        builder: (_, __) => const DrivePage(),
      ),
      GoRoute(
        path: AppRoutes.locationStart,
        builder: (_, __) => const LocationPickerPage(mode: PickMode.start),
      ),
      GoRoute(
        path: AppRoutes.locationDestination,
        builder: (_, __) => const LocationPickerPage(mode: PickMode.destination),
      ),
       GoRoute(
        path: AppRoutes.tripSummary,
        builder: (_, state) {
          final summary = state.extra as TripSummary;
          return TripSummaryView(summary: summary);
        },
      ),
    ],
  );
}
