import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class MissionView extends StatelessWidget {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('미션'),
      ),
      body: const Center(
        child: Text('Mission View'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}
