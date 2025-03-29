import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const CashDrivingApp());
}

class CashDrivingApp extends StatelessWidget {
  const CashDrivingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash Driving',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
