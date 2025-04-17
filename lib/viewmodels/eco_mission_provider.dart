// lib/viewmodels/eco_mission_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/eco_missions.dart';

// 탭 상태 관리
final missionTabProvider = StateProvider<int>((ref) => 0);

// 전체 미션 리스트 (하드코딩 예시)
final ecoMissionProvider = StateNotifierProvider<EcoMissionNotifier, List<EcoMission>>((ref) {
  return EcoMissionNotifier();
});

class EcoMissionNotifier extends StateNotifier<List<EcoMission>> {
  EcoMissionNotifier() : super([
    EcoMission(
      id: 'm1',
      title: '금제동 없이 10km 주행',
      description: '오늘 하루 동안 금제동 없이 10km를 주행하세요',
      point: 50,
      current: 3,
      goal: 10,
      currentLabel: '3km',
      goalLabel: '10km',
      type: 0,
    ),
    EcoMission(
      id: 'm2',
      title: '친환경 운전 1시간',
      description: '에코 드라이브 모드로 1시간 운전하기',
      point: 30,
      current: 30,
      goal: 60,
      currentLabel: '30분',
      goalLabel: '1시간',
      type: 0,
      isAccepted: true,
    ),
    EcoMission(
      id: 'm3',
      title: '정속 주행 달성',
      description: '고속도로에서 30분 정속 주행 유지하기',
      point: 40,
      current: 0,
      goal: 30,
      currentLabel: '0분',
      goalLabel: '30분',
      type: 0,
    ),
    EcoMission(
      id: 'w1',
      title: '일주일 동안 50km 주행',
      description: '이번 주 동안 누적 50km 이상 주행하기',
      point: 100,
      current: 20,
      goal: 50,
      currentLabel: '20km',
      goalLabel: '50km',
      type: 1,
    ),

    EcoMission(
      id: 'w2',
      title: '주행 중 급가속 없이 5회 완료',
      description: '급가속 없이 주행한 횟수가 5회 이상이면 완료됩니다.',
      point: 80,
      current: 3,
      goal: 5,
      currentLabel: '3회',
      goalLabel: '5회',
      type: 1,
    ),
    EcoMission(
      id: 'c1',
      title: '야간 운전 2시간',
      description: '밤 9시 이후에 총 2시간 이상 운전하기',
      point: 60,
      current: 90,
      goal: 120,
      currentLabel: '1시간 30분',
      goalLabel: '2시간',
      type: 2,
    ),

    EcoMission(
      id: 'c2',
      title: '출퇴근 시간대 에코 운전',
      description: '출근/퇴근 시간대에 에코 운전 3회 수행',
      point: 70,
      current: 1,
      goal: 3,
      currentLabel: '1회',
      goalLabel: '3회',
      type: 2,
    ),

  ]);

  void toggleMission(String id) {
    state = state.map((m) {
      if (m.id == id) {
        return m.copyWith(isAccepted: !m.isAccepted);
      }
      return m;
    }).toList();
  }
}

// 필터링된 미션 목록
final filteredMissionListProvider = Provider<List<EcoMission>>((ref) {
  final tab = ref.watch(missionTabProvider);
  final missions = ref.watch(ecoMissionProvider);
  return missions.where((m) => m.type == tab).toList();
});
