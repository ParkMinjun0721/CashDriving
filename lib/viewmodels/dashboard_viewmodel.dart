import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/dashboard_data_model.dart';
import 'tab_controller.dart';

final dashboardDataProvider = Provider<DashboardData>((ref) {
  final selectedTab = ref.watch(selectedTabProvider);

  switch (selectedTab) {
    case 0: // Weekly
      return DashboardData(
        ecoScore: "2.8kg",
        fuelEfficiency: "+12%",
        rankings: [
          RankingData(label: 'Regional Rank', valueText: 'Top 15%', ratio: 0.85),
          RankingData(label: 'Age Group Rank', valueText: 'Top 8%', ratio: 0.92),
          RankingData(label: 'Vehicle Type Rank', valueText: 'Top 22%', ratio: 0.78),
        ],
        ecoScoreTrend: [
          FlSpot(0, 82),
          FlSpot(1, 84),
          FlSpot(2, 83),
          FlSpot(3, 85),
          FlSpot(4, 87),
          FlSpot(5, 88),
          FlSpot(6, 90),
        ],
        carbonSavedTrend: [
          FlSpot(0, 0.4),
          FlSpot(1, 0.5),
          FlSpot(2, 0.3),
          FlSpot(3, 0.6),
          FlSpot(4, 0.7),
          FlSpot(5, 0.8),
          FlSpot(6, 0.9),
        ],
        fuelEfficiencyTrend: [
          FlSpot(0, 6.5),
          FlSpot(1, 6.8),
          FlSpot(2, 6.9),
          FlSpot(3, 7.1),
          FlSpot(4, 7.2),
          FlSpot(5, 7.5),
          FlSpot(6, 7.6),
        ],
      );

    case 1: // Monthly
      return DashboardData(
        ecoScore: "10.2kg",
        fuelEfficiency: "+8%",
        rankings: [
          RankingData(label: 'Regional Rank', valueText: 'Top 12%', ratio: 0.88),
          RankingData(label: 'Age Group Rank', valueText: 'Top 10%', ratio: 0.90),
          RankingData(label: 'Vehicle Type Rank', valueText: 'Top 25%', ratio: 0.75),
        ],
        ecoScoreTrend: [
          FlSpot(0, 78),
          FlSpot(1, 79),
          FlSpot(2, 81),
          FlSpot(3, 84),
        ],
        carbonSavedTrend: [
          FlSpot(0, 2.3),
          FlSpot(1, 2.6),
          FlSpot(2, 2.7),
          FlSpot(3, 2.9),
        ],
        fuelEfficiencyTrend: [
          FlSpot(0, 6.8),
          FlSpot(1, 6.9),
          FlSpot(2, 7.1),
          FlSpot(3, 7.3),
        ],
      );

    default: // Total
      return DashboardData(
        ecoScore: "38.7kg",
        fuelEfficiency: "+10%",
        rankings: [
          RankingData(label: 'Regional Rank', valueText: 'Top 9%', ratio: 0.91),
          RankingData(label: 'Age Group Rank', valueText: 'Top 6%', ratio: 0.94),
          RankingData(label: 'Vehicle Type Rank', valueText: 'Top 20%', ratio: 0.80),
        ],
        ecoScoreTrend: List.generate(12, (i) => FlSpot(i.toDouble(), 70 + i * 1.5)),
        carbonSavedTrend: List.generate(12, (i) => FlSpot(i.toDouble(), 1.5 + i * 0.8)),
        fuelEfficiencyTrend: List.generate(12, (i) => FlSpot(i.toDouble(), 6.5 + i * 0.2)),
      );
  }
});
