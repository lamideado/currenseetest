import 'package:currenseetest/intro_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:currenseetest/onboarding_screen.dart';
import 'themes/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primary),
      home: const WelcomePage(),
    );
  }
}
