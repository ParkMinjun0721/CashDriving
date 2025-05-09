import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/custom_colors_provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';

class MyPageView extends ConsumerWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColors = ref.watch(customColorsProvider); // Get CustomColors
    return Scaffold(
      appBar: CustomAppBar_Main(backgroundColor: customColors.white),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _ProfileSection(),
            SizedBox(height: 24),
            _EcoDrivingScore(score: 92),
            SizedBox(height: 24),
            _BadgeSection(),
            SizedBox(height: 24),
            _BottomButtons(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 36,
          backgroundColor: Colors.grey,
          child: Text('Image'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Kim Yechan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Safe Driving Master', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
      ],
    );
  }
}

class _EcoDrivingScore extends StatelessWidget {
  final int score;
  const _EcoDrivingScore({required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Accumulated Eco-Driving Score'),
              Text('$score pts', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: score / 100,
            backgroundColor: Colors.grey.shade200,
            color: Colors.black,
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}

class _BadgeSection extends StatelessWidget {
  const _BadgeSection();

  @override
  Widget build(BuildContext context) {
    final badges = [
      {'icon': Icons.eco, 'label': 'Eco Driver'},
      {'icon': Icons.shield, 'label': 'Safety Master'},
      {'icon': Icons.emoji_events, 'label': 'Top Driver'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Earned Badges', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: badges.map((badge) {
            return Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(badge['icon'] as IconData, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(badge['label'] as String, style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: const Text('View Driving History'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: const Text('Edit Profile'),
          ),
        )
      ],
    );
  }
}
