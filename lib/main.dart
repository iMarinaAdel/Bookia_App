import 'package:bookia/core/utils/app_theme.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookiaApp());
}

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
