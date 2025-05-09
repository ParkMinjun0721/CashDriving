import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('운전 리포트'),
      ),
      body: const Center(
        child: Text('Report View'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}
