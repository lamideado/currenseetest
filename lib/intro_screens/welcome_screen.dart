import 'package:currenseetest/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:currenseetest/onboarding_screen.dart'; // Import OnBoardingScreen

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0), // Adjust radius as desired
          child: Image.asset(
            "assets/images/2024.png",
            width: 200.0, // Adjust width as desired
            height: 200.0, // Adjust height as desired
          ),
        ),
      ),
    );
  }
}
