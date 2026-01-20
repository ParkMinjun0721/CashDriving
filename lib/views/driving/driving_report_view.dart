// 요약: 주행 리포트 화면(추가 구현 대상)입니다.
// - 주행 결과를 시각화하기 위한 UI 골격을 제공합니다.
// - 대시보드/요약 화면과 연동할 수 있습니다.
// - 상세 데이터 바인딩은 향후 확장이 필요합니다.
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
