import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AdstacksApp());
}

class AdstacksApp extends StatelessWidget {
  const AdstacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adstacks Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const DashboardScreen(),
    );
  }
}
