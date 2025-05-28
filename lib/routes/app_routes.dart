// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../views/main/main_view.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/mission/mission_view.dart';
import '../views/point_shop/point_shop_view.dart';
import '../views/mypage/mypage_view.dart';
import '../views/login/login_view.dart';
import '../views/driving/driving_map_view.dart';

import '../views/driving/trip_summary_view.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainView());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardView());
      case '/mission':
        return MaterialPageRoute(builder: (_) => const MissionView());
      case '/shop':
        return MaterialPageRoute(builder: (_) => const PointShopView());
      case '/mypage':
        return MaterialPageRoute(builder: (_) => const MyPageView());
      case '/driving':
        return MaterialPageRoute(builder: (_) => const DrivingMapView());

      case '/tripSummary':
        final summary = settings.arguments as TripSummary;
        return MaterialPageRoute(
          builder: (_) => TripSummaryView(summary: summary),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const MainView(), // fallback
        );
    }
  }
}
