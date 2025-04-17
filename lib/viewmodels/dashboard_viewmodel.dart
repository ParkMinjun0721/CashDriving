import 'package:cash_driving/viewmodels/tab_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_data_model.dart';

final dashboardDataProvider = Provider<DashboardData>((ref) {
  final selectedTab = ref.watch(selectedTabProvider);

  switch (selectedTab) {
    case 0: // 주간
      return DashboardData(
        ecoScore: "2.8kg",
        fuelEfficiency: "+12%",
        rankings: [
          RankingData(label: '지역별 순위', valueText: '상위 15%', ratio: 0.85),
          RankingData(label: '연령대별 순위', valueText: '상위 8%', ratio: 0.92),
          RankingData(label: '차종별 순위', valueText: '상위 22%', ratio: 0.78),
        ],
        ecoScoreTrend: [
          FlSpot(0, 82), FlSpot(1, 84), FlSpot(2, 85), FlSpot(3, 87),
          FlSpot(4, 89), FlSpot(5, 91), FlSpot(6, 93),
        ],
        carbonSavedTrend: [
          FlSpot(0, 1.0), FlSpot(1, 1.2), FlSpot(2, 1.3), FlSpot(3, 1.5),
          FlSpot(4, 1.7), FlSpot(5, 2.0), FlSpot(6, 2.3),
        ],
        fuelEfficiencyTrend: [
          FlSpot(0, 7.0), FlSpot(1, 7.2), FlSpot(2, 7.1), FlSpot(3, 7.4),
          FlSpot(4, 7.6), FlSpot(5, 7.8), FlSpot(6, 8.0),
        ],
      );
    case 1: // 월간
      return DashboardData(
        ecoScore: "10.2kg",
        fuelEfficiency: "+8%",
        rankings: [
          RankingData(label: '지역별 순위', valueText: '상위 12%', ratio: 0.88),
          RankingData(label: '연령대별 순위', valueText: '상위 10%', ratio: 0.90),
          RankingData(label: '차종별 순위', valueText: '상위 25%', ratio: 0.75),
        ],
        ecoScoreTrend: [
          FlSpot(0, 82), FlSpot(1, 84), FlSpot(2, 85), FlSpot(3, 87),
          FlSpot(4, 89), FlSpot(5, 91), FlSpot(6, 93),
        ],
        carbonSavedTrend: [
          FlSpot(0, 1.0), FlSpot(1, 1.2), FlSpot(2, 1.3), FlSpot(3, 1.5),
          FlSpot(4, 1.7), FlSpot(5, 2.0), FlSpot(6, 2.3),
        ],
        fuelEfficiencyTrend: [
          FlSpot(0, 7.0), FlSpot(1, 7.2), FlSpot(2, 7.1), FlSpot(3, 7.4),
          FlSpot(4, 7.6), FlSpot(5, 7.8), FlSpot(6, 8.0),
        ],
      );
    default: // 전체
      return DashboardData(
        ecoScore: "38.7kg",
        fuelEfficiency: "+10%",
        rankings: [
          RankingData(label: '지역별 순위', valueText: '상위 9%', ratio: 0.91),
          RankingData(label: '연령대별 순위', valueText: '상위 6%', ratio: 0.94),
          RankingData(label: '차종별 순위', valueText: '상위 20%', ratio: 0.80),
        ],
        ecoScoreTrend: [
          FlSpot(0, 82), FlSpot(1, 84), FlSpot(2, 85), FlSpot(3, 87),
          FlSpot(4, 89), FlSpot(5, 91), FlSpot(6, 93),
        ],
        carbonSavedTrend: [
          FlSpot(0, 1.0), FlSpot(1, 1.2), FlSpot(2, 1.3), FlSpot(3, 1.5),
          FlSpot(4, 1.7), FlSpot(5, 2.0), FlSpot(6, 2.3),
        ],
        fuelEfficiencyTrend: [
          FlSpot(0, 7.0), FlSpot(1, 7.2), FlSpot(2, 7.1), FlSpot(3, 7.4),
          FlSpot(4, 7.6), FlSpot(5, 7.8), FlSpot(6, 8.0),
        ],
      );
  }
});
