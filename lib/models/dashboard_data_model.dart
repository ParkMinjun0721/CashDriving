// 요약: 대시보드 통계/차트 데이터를 담는 모델입니다.
// - 에코 스코어 추이, 랭킹 등 데이터를 구조화합니다.
// - 뷰모델에서 생성된 데이터를 UI에 전달합니다.
// - 확장 가능한 데이터 구조를 제공합니다.
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
