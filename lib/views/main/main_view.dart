// main_view.dart
import 'package:cash_driving/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/config_car_model.dart';
import '../../services/tmap_sdk_initializer.dart';
import '../../theme/box_shadow_styles.dart';
import '../../theme/theme.dart';
import '../../viewmodels/custom_colors_provider.dart';
import '../../viewmodels/point_provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';

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

class _DrivingStartSection extends ConsumerWidget {
  final CustomColors customColors;
  const _DrivingStartSection({required this.customColors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSdkInitialized = ref.watch(tmapSdkInitializedProvider);

    return GestureDetector(
      child: Center(
        child: Container(
          width: 192,
          height: 192,
          decoration: BoxDecoration(
            color: isSdkInitialized ? Colors.blue.shade600 : Colors.red.shade400,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.drive_eta, size: 36, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                isSdkInitialized ? "Start Driving" : "SDK Not Initialized",
                style: pretendardBold(context).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
        if (!isSdkInitialized) {
          await _initializeTmapSdk(ref, context);
        } else {
          Navigator.pushNamed(context, '/driving');
        }
      },
    );
  }

  Future<void> _initializeTmapSdk(WidgetRef ref, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Initializing Tmap SDK..."),
        duration: Duration(seconds: 2),
      ),
    );
    await TmapSdkInitializer.initializeTmapSdk(context, ref);
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
        borderRadius: BorderRadius.circular(12),
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
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: score / 100,
              backgroundColor: customColors.neutral80,
              color: Colors.blue.shade600,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class _PointSection extends ConsumerWidget {
  final CustomColors customColors;

  const _PointSection({required this.customColors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final point = ref.watch(pointProvider);

    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: customColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: BoxShadowStyles.shadow1(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Current Points", style: pretendardMedium(context)),
          Row(
            children: [
              const Icon(Icons.monetization_on_outlined, color: Colors.blue),
              const SizedBox(width: 4),
              Text("$point", style: pretendardBold(context).copyWith(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}