import 'package:flutter/material.dart';

// CONFIG
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_radius.dart';
import '../../features/login/widgets/instituion_login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding/find_jobs.png",
      "title": "Find Education Jobs Easily",
      "desc":
          "Connect with top-tier schools or find the perfect educator in just a few taps.",
    },
    {
      "image": "assets/images/onboarding/hire_edu.png",
      "title": "Hire the Right Educators",
      "desc": "Browse verified teacher profiles and hire the best talent.",
    },
    {
      "image": "assets/images/onboarding/track_manage.png",
      "title": "Track & Manage Hiring",
      "desc": "Manage applications and streamline your hiring workflow.",
    },
  ];

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      goToApp();
    }
  }

  void goToApp() {
    print("Navigate to role selection / login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //  BACKGROUND GRADIENT
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7FAFF), Color(0xFFEFF6FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                // 🔷 TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.school, color: AppColors.primary),
                        SizedBox(width: 6),
                        Text(
                          "Lerny",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: goToApp,
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                //  TOP GLOW
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                //  PAGE CONTENT
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      final item = onboardingData[index];

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // PREMIUM IMAGE CARD
                            AnimatedScale(
                              scale: currentIndex == index ? 1 : 0.92,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                height: 240,
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    AppRadius.lg,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.06,
                                      ),
                                      blurRadius: 25,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  item["image"]!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            SizedBox(height: AppSpacing.lg),

                            //  TITLE
                            Text(
                              item["title"]!,
                              style: AppTextStyles.heading.copyWith(
                                fontSize: 24,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: AppSpacing.sm),

                            //  DESCRIPTION
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                item["desc"]!,
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 15,
                                  height: 1.5,
                                  color: AppColors.textSecondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: AppSpacing.lg),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => _dot(active: index == currentIndex),
                  ),
                ),

                SizedBox(height: AppSpacing.lg),

                //  PRIMARY BUTTON
                GestureDetector(
                  onTap: nextPage,
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2670DA), Color(0xFF0E8F90)],
                      ),
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        currentIndex == onboardingData.length - 1
                            ? "Continue as Candidate →"
                            : "Next →",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: AppSpacing.md),

                // SECONDARY BUTTON
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InstitutionLogin(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Continue as Institution",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dot({bool active = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.greyMedium,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }
}
