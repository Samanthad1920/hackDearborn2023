import 'package:flutter/material.dart';
import 'package:website/utils/colors.dart';
import 'package:website/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backpacking Trip Planner',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary),
        home: Home(),
    );
  }
}
