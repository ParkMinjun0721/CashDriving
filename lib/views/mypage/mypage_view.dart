import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
      ),
      body: const Center(
        child: Text('My Page View'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 5),
    );
  }
}
