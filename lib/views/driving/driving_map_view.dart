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
