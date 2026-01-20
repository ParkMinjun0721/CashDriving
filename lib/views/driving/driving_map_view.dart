// 요약: 플랫폼 채널로 내비게이션 시작을 호출하는 화면입니다.
// - MethodChannel을 통해 네이티브 내비게이션을 트리거합니다.
// - 단순 샘플 UI로 호출 결과를 로그로 확인합니다.
// - 추가 기능 확장을 위한 베이스 화면입니다.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

class DrivingMapView extends ConsumerStatefulWidget {
  const DrivingMapView({super.key});

  @override
  ConsumerState<DrivingMapView> createState() => _DrivingMapViewState();
}

class _DrivingMapViewState extends ConsumerState<DrivingMapView> {
  static const platform = MethodChannel('tmap/navigation');

  void _startNavigation() async {
    try {
      final result = await platform.invokeMethod('startTmapNavigation');
      print('Navigation Result: $result');
    } catch (e) {
      print('Error starting navigation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Destination"),
        actions: [
          TextButton(
            onPressed: _startNavigation,
            child: const Text("Start Navigation"),
          )
        ],
      ),
      body: Center(
        child: Text("Tmap Navigation Integration"),
      ),
    );
  }
}
