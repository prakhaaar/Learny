import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;

  const OnboardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
