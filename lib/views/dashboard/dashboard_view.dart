import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('대시보드'),
      ),
      body: const Center(
        child: Text('Statistic Dashboard View'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
