import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    final routes = [
      '/',
      '/dashboard',
      '/shop',
      '/mission',
      '/report',
      '/mypage',
    ];
    if (index != currentIndex) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '대시보드'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '포인트샵'),
        BottomNavigationBarItem(icon: Icon(Icons.flag), label: '미션'),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: '리포트'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
