// 요약: 에코 스코어 차트를 렌더링하는 위젯입니다.
// - 차트 라이브러리 설정과 데이터 포맷을 처리합니다.
// - 축/색상/라인 스타일을 통일해 제공합니다.
// - 대시보드 카드와 결합해 사용됩니다.
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class EcoScoreChart extends StatelessWidget {
  final List<FlSpot> dataPoints;

  const EcoScoreChart({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return SizedBox(
      height: 160,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: dataPoints.length - 1,
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: customColors.primary!,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
