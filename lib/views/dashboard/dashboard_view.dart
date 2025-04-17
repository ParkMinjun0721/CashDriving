import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/font.dart';
import '../../theme/theme.dart';
import '../../viewmodels/custom_colors_provider.dart';
import '../../viewmodels/dashboard_viewmodel.dart';
import '../../viewmodels/tab_controller.dart'; // ✅ 여기 추가!
import '../../widgets/custom_app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/eco_score_chart.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColors = ref.watch(customColorsProvider);
    final selectedTab = ref.watch(selectedTabProvider);
    final dashboardData = ref.watch(dashboardDataProvider);

    return Scaffold(
      backgroundColor: customColors.white,
      appBar: CustomAppBar_Main(backgroundColor: customColors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 탭 메뉴
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    _DashboardTab(
                      text: ["주간", "월간", "전체"][i],
                      isSelected: selectedTab == i,
                      onTap: () => ref.read(selectedTabProvider.notifier).state = i, // ✅ 상태 변경
                    ),
                ],
              ),
              const SizedBox(height: 20),
        
              Text('에코 점수 변화 추이', style: heading_xsmall(context)),
              const SizedBox(height: 8),
              EcoScoreChart(dataPoints: dashboardData.ecoScoreTrend),

              const SizedBox(height: 24),
        
              Text('탄소 절감량', style: heading_xsmall(context)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이번 ${["주", "월", "기간"][selectedTab]} 절감량', style: body_small(context)),
                  Text(dashboardData.ecoScore, style: body_small(context).copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              EcoScoreChart(dataPoints: dashboardData.carbonSavedTrend),

              const SizedBox(height: 24),
        
              Text('연비 향상률', style: heading_xsmall(context)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('평균 대비', style: body_small(context)),
                  Text(dashboardData.fuelEfficiency,
                      style: body_small(context).copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              EcoScoreChart(dataPoints: dashboardData.fuelEfficiencyTrend),

              const SizedBox(height: 24),
        
              Text('나의 랭킹', style: heading_xsmall(context)),
              const SizedBox(height: 12),
              _RankingBar(
                label: dashboardData.rankings[0].label,
                valueText: dashboardData.rankings[0].valueText,
                ratio: dashboardData.rankings[0].ratio,
              ),
              _RankingBar(
                label: dashboardData.rankings[1].label,
                valueText: dashboardData.rankings[1].valueText,
                ratio: dashboardData.rankings[1].ratio,
              ),
              _RankingBar(
                label: dashboardData.rankings[2].label,
                valueText: dashboardData.rankings[2].valueText,
                ratio: dashboardData.rankings[2].ratio,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

// 탭 버튼
class _DashboardTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _DashboardTab({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: body_small(context).copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class _RankingBar extends StatelessWidget {
  final String label;
  final String valueText;
  final double ratio; // 0.0 ~ 1.0

  const _RankingBar({
    required this.label,
    required this.valueText,
    required this.ratio,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: customColors.neutral90,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$label  $valueText', style: body_small(context)),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(customColors.primary!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
