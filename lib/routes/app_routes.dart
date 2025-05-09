import 'package:flutter/material.dart';
import '../views/driving/driving_map_view.dart';
import '../views/main/main_view.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/point_shop/point_shop_view.dart';
import '../views/mission/mission_view.dart';
import '../views/driving/driving_report_view.dart';
import '../views/mypage/mypage_view.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const MainView(),
    '/dashboard': (context) => const DashboardView(),
    '/shop': (context) => const PointShopView(),
    '/mission': (context) => const MissionView(),
    '/report': (context) => const ReportView(),
    '/mypage': (context) => const MyPageView(),
    '/driving': (context) => const DrivingMapView(),
  };
}
