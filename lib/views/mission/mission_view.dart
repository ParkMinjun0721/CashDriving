// lib/views/mission/mission_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/eco_mission_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../theme/font.dart';
import '../../theme/theme.dart';

class MissionView extends ConsumerWidget {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final selectedTab = ref.watch(missionTabProvider);
    final missions = ref.watch(filteredMissionListProvider);

    return Scaffold(
      appBar: const CustomAppBar_Mission(),
      body: Column(
        children: [
          // 탭
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                final label = ['일일 미션', '주간 미션', '맞춤형 미션'][index];
                final isSelected = selectedTab == index;
                return GestureDetector(
                  onTap: () => ref.read(missionTabProvider.notifier).state = index,
                  child: Column(
                    children: [
                      Text(
                        label,
                        style: pretendardBold(context).copyWith(
                          fontSize: 16,
                          color: isSelected ? customColors.black : customColors.neutral60,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 2,
                        width: 60,
                        color: isSelected ? customColors.black : Colors.transparent,
                      )
                    ],
                  ),
                );
              }),
            ),
          ),

          const Divider(),

          // 미션 리스트
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: missions.length,
              itemBuilder: (context, index) {
                final mission = missions[index];
                final progressPercent = mission.current / mission.goal;
                final isCompleted = progressPercent >= 1.0;

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: customColors.neutral100,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목 + 포인트
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(mission.title, style: pretendardBold(context)),
                          Text('+${mission.point}P', style: pretendardBold(context)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // 설명
                      Text(mission.description, style: body_small(context)),
                      const SizedBox(height: 12),
                      // 진행도
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${mission.currentLabel} / ${mission.goalLabel}',
                              style: body_xsmall(context)),
                          isCompleted
                              ? const Icon(Icons.check_circle, color: Colors.green)
                              : const SizedBox.shrink(),
                        ],
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: progressPercent.clamp(0.0, 1.0),
                        backgroundColor: customColors.neutral80,
                        valueColor: AlwaysStoppedAnimation(customColors.primary),
                      ),
                      const SizedBox(height: 12),
                      // 버튼
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(ecoMissionProvider.notifier).toggleMission(mission.id);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: mission.isAccepted ? customColors.error : Colors.white,
                            backgroundColor: mission.isAccepted ? Colors.white : Colors.black,
                            side: mission.isAccepted
                                ? BorderSide(color: customColors.error!)
                                : BorderSide.none,
                          ),
                          child: Text(mission.isAccepted ? '포기하기' : '수락하기'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
