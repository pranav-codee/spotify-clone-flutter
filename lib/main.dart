import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false, // Removes debug banner
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}

// Temporary home screen
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to ${AppStrings.appName}!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
