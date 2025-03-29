import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Cash Driving'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '오늘도 안전하고 친환경적인 운전을 시작해볼까요?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  '운전 시작하기 (지도/내비 UI)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MainMenuButton(
                  icon: Icons.flag,
                  label: '미션',
                  onTap: () => Navigator.pushNamed(context, '/mission'),
                ),
                _MainMenuButton(
                  icon: Icons.shopping_cart,
                  label: '포인트샵',
                  onTap: () => Navigator.pushNamed(context, '/shop'),
                ),
                _MainMenuButton(
                  icon: Icons.analytics,
                  label: '리포트',
                  onTap: () => Navigator.pushNamed(context, '/report'),
                ),
                _MainMenuButton(
                  icon: Icons.person,
                  label: '마이페이지',
                  onTap: () => Navigator.pushNamed(context, '/mypage'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}

class _MainMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MainMenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green.shade300,
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}