import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class PointShopView extends StatelessWidget {
  const PointShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('포인트 샵'),
      ),
      body: const Center(
        child: Text('Point Shop View'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
