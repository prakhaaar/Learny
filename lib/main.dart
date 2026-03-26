import 'dart:async';
import 'package:flutter/material.dart';

//  CONFIGS
import 'core/constants/app_colors.dart';
import 'core/constants/app_text_styles.dart';
import 'core/constants/app_spacing.dart';
import 'core/constants/app_radius.dart';
import 'core/constants/app_gradients.dart';

import 'features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const LernyApp());
}

class LernyApp extends StatelessWidget {
  const LernyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        progress += 0.02;
      });

      if (progress >= 1) {
        timer.cancel();

        Future.delayed(const Duration(milliseconds: 300), () {
          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        //  USING GRADIENT CONFIG
        decoration: const BoxDecoration(gradient: AppGradients.primaryGradient),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Icon Box
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.glass,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(Icons.school, size: 40, color: AppColors.white),
            ),

            SizedBox(height: AppSpacing.lg),

            //  Title
            const Text("Lerny", style: AppTextStyles.title),

            SizedBox(height: AppSpacing.sm),

            //  Subtitle
            const Text(
              "Hire & Get Hired in Education",
              style: AppTextStyles.subtitle,
            ),

            SizedBox(height: AppSpacing.xxl),

            //  Progress Bar
            Container(
              width: 140,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 140 * progress,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSpacing.sm),

            //  Initializing
            const Text(
              "INITIALIZING",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
