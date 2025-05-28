import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cash_driving/theme/theme.dart';
import 'package:cash_driving/viewmodels/theme_controller.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: CashDrivingApp()));
}

class CashDrivingApp extends ConsumerWidget {
  const CashDrivingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    final themeController = ref.read(themeProvider.notifier);

    return MaterialApp(
      title: 'Cash Driving',
      theme: isLightTheme ? themeController.lightTheme : themeController.darkTheme,
      darkTheme: themeController.darkTheme,
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
