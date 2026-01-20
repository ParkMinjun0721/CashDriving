// 요약: 하단 탭 네비게이션 UI와 이동 로직을 제공합니다.
// - 탭 인덱스 변경 시 네비게이션 컨트롤러를 호출합니다.
// - Home/Dashboard/Mission/Shop/MyPage 탭을 제공합니다.
// - 현재 탭 상태를 기반으로 선택 스타일을 표시합니다.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/navigation_controller.dart'; // 분리된 로직 참조

class BottomNavBar extends ConsumerWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navController = ref.read(navigationProvider.notifier);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index != currentIndex) {
          navController.navigateToIndex(context, index);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Mission'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MyPage'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
