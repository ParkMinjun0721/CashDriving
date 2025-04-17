import 'package:fl_chart/fl_chart.dart';

class DashboardData {
  final String ecoScore;
  final String fuelEfficiency;
  final List<RankingData> rankings;
  final List<FlSpot> ecoScoreTrend; // ✅ 추가
  final List<FlSpot> carbonSavedTrend;    // ✅ 탄소 절감량 추이
  final List<FlSpot> fuelEfficiencyTrend; // ✅ 연비 향상률 추이

  DashboardData({
    required this.ecoScore,
    required this.fuelEfficiency,
    required this.rankings,
    required this.ecoScoreTrend,
    required this.carbonSavedTrend,
    required this.fuelEfficiencyTrend,
  });
}

class RankingData {
  final String label;
  final String valueText;
  final double ratio;

  RankingData({
    required this.label,
    required this.valueText,
    required this.ratio,
  });
}
