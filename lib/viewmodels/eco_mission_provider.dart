// lib/viewmodels/eco_mission_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/eco_missions.dart';

// Tab state management
final missionTabProvider = StateProvider<int>((ref) => 0);

// Full mission list (example with hardcoded data)
final ecoMissionProvider = StateNotifierProvider<EcoMissionNotifier, List<EcoMission>>((ref) {
  return EcoMissionNotifier();
});

class EcoMissionNotifier extends StateNotifier<List<EcoMission>> {
  EcoMissionNotifier() : super([
    EcoMission(
      id: 'm1',
      title: '10km Without Sudden Braking',
      description: 'Drive 10km today without any sudden braking.',
      point: 50,
      current: 3,
      goal: 10,
      currentLabel: '3km',
      goalLabel: '10km',
      type: 0,
    ),
    EcoMission(
      id: 'm2',
      title: '1 Hour of Eco-Driving',
      description: 'Drive in eco mode for a total of 1 hour.',
      point: 30,
      current: 30,
      goal: 60,
      currentLabel: '30min',
      goalLabel: '1h',
      type: 0,
      isAccepted: true,
    ),
    EcoMission(
      id: 'm3',
      title: 'Maintain Steady-Speed Driving',
      description: 'Drive on the highway for 30 minutes at a constant speed.',
      point: 40,
      current: 0,
      goal: 30,
      currentLabel: '0min',
      goalLabel: '30min',
      type: 0,
    ),
    EcoMission(
      id: 'w1',
      title: 'Drive 50km in a Week',
      description: 'Drive a total of 50km over the course of this week.',
      point: 100,
      current: 20,
      goal: 50,
      currentLabel: '20km',
      goalLabel: '50km',
      type: 1,
    ),
    EcoMission(
      id: 'w2',
      title: 'Complete 5 Trips Without Sudden Acceleration',
      description: 'Complete 5 trips without any sudden acceleration.',
      point: 80,
      current: 3,
      goal: 5,
      currentLabel: '3 times',
      goalLabel: '5 times',
      type: 1,
    ),
    EcoMission(
      id: 'c1',
      title: '2 Hours of Night Driving',
      description: 'Drive for more than 2 hours after 9 PM.',
      point: 60,
      current: 90,
      goal: 120,
      currentLabel: '1h 30min',
      goalLabel: '2h',
      type: 2,
    ),
    EcoMission(
      id: 'c2',
      title: 'Eco-Driving During Commute Hours',
      description: 'Drive in eco mode 3 times during commuting hours.',
      point: 70,
      current: 1,
      goal: 3,
      currentLabel: '1 time',
      goalLabel: '3 times',
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

// Filtered mission list by tab type
final filteredMissionListProvider = Provider<List<EcoMission>>((ref) {
  final tab = ref.watch(missionTabProvider);
  final missions = ref.watch(ecoMissionProvider);
  return missions.where((m) => m.type == tab).toList();
});
