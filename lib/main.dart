import 'dart:async';
import 'package:flutter/material.dart';

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

    // Progress animation
    Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        progress += 0.02;
      });

      if (progress >= 1) {
        timer.cancel();

        //  Navigate after loading
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Placeholder(), // next screen
            ),
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

        //  Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2670DA), // Top
              Color(0xFF0E8F90), // Bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Icon Box
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(Icons.school, size: 40, color: Colors.white),
            ),

            const SizedBox(height: 24),

            //  Title
            const Text(
              "Lerny",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 10),

            //  Subtitle
            const Text(
              "Hire & Get Hired in Education",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 80),

            //  Progress Bar
            Container(
              width: 140,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 140 * progress,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            //  Initializing Text
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
