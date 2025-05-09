import 'package:cash_driving/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/box_shadow_styles.dart';
import '../../theme/theme.dart';
import '../../viewmodels/custom_colors_provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';

/// Provider for managing the eco-driving score state
final scoreProvider = StateProvider<int>((ref) => 85);

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColors = ref.watch(customColorsProvider);
    final score = ref.watch(scoreProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: CustomAppBar_Main(backgroundColor: customColors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _DrivingStartSection(customColors: customColors),
              const SizedBox(height: 24),
              _EcoScoreSection(score: score, customColors: customColors),
              const SizedBox(height: 16),
              _PointSection(customColors: customColors),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}

class _DrivingStartSection extends StatelessWidget {
  final CustomColors customColors;

  const _DrivingStartSection({required this.customColors});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 192,
          height: 192,
          decoration: BoxDecoration(
            color: customColors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.drive_eta, size: 30, color: customColors.white),
              const SizedBox(height: 8),
              Text("Start Driving", style: pretendardBold(context).copyWith(color: customColors.white)),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.pushNamed(context, '/driving'),
    );
  }
}

class _EcoScoreSection extends StatelessWidget {
  final int score;
  final CustomColors customColors;

  const _EcoScoreSection({required this.score, required this.customColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: customColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: BoxShadowStyles.shadow1(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today's Eco-Driving Score", style: pretendardMedium(context)),
              Text("$score pts", style: pretendardBold(context).copyWith(fontSize: 20)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: score / 100,
            backgroundColor: customColors.neutral80,
            color: customColors.success,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}

class _PointSection extends StatelessWidget {
  final CustomColors customColors;

  const _PointSection({required this.customColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: customColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: BoxShadowStyles.shadow1(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Current Points", style: pretendardMedium(context)),
          Row(
            children: [
              const Icon(Icons.attach_money_outlined),
              Text("12,500", style: pretendardBold(context).copyWith(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
