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
