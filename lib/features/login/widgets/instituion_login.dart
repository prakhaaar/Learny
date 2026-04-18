import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_gradients.dart';

class InstitutionLogin extends StatefulWidget {
  const InstitutionLogin({super.key});

  @override
  State<InstitutionLogin> createState() => _InstitutionLoginState();
}

class _InstitutionLoginState extends State<InstitutionLogin> {
  String selectedType = "K-12 School";
  bool _obscurePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 32),
              _titleSection(),
              const SizedBox(height: 28),
              _institutionType(),
              const SizedBox(height: 28),
              _socialButtons(),
              const SizedBox(height: 24),
              _divider(),
              const SizedBox(height: 20),
              _emailField(),
              const SizedBox(height: 16),
              _passwordField(),
              const SizedBox(height: 28),
              _signInButton(),
              const SizedBox(height: 20),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.greyLight),
            ),
            child: const Icon(Icons.close, size: 16),
          ),
        ),
        const Text(
          "Lerny",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 36),
      ],
    );
  }

  Widget _titleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Institution Login", style: AppTextStyles.heading),
        SizedBox(height: 8),
        Text(
          "Manage your educational staffing\nand recruitment.",
          style: AppTextStyles.body,
        ),
      ],
    );
  }

  Widget _institutionType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "INSTITUTION TYPE",
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _chip("K-12 School"),
            _chip("University"),
            _chip("Coaching Center"),
            _chip("Other"),
          ],
        ),
      ],
    );
  }

  Widget _chip(String text) {
    final isSelected = selectedType == text;
    return GestureDetector(
      onTap: () => setState(() => selectedType = text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.greyLight,
          ),
          color: isSelected
              ? AppColors.primary.withOpacity(0.08)
              : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? AppColors.primary : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _socialButtons() {
    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata_rounded, size: 20),
          label: const Text("Continue with Google"),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.linked_camera_rounded,
              size: 18,
              color: Colors.white,
            ),
            label: const Text(
              "Continue with LinkedIn",
              style: AppTextStyles.button,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: const Size(double.infinity, 52),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "OR WITH EMAIL",
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Work Email Address",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "admin@institution.edu",
            filled: true,
            fillColor: AppColors.greyLight.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Password",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            Text(
              "Forgot password?",
              style: TextStyle(fontSize: 12, color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: "••••••••",
            filled: true,
            fillColor: AppColors.greyLight.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _signInButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppGradients.primaryGradient,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
        onPressed: () {
          debugPrint("Email: ${emailController.text}");
          debugPrint("Password: ${passwordController.text}");
          debugPrint("Type: $selectedType");
        },
        child: const Text("Sign In", style: AppTextStyles.button),
      ),
    );
  }

  Widget _footer() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Not registered yet? ", style: TextStyle(fontSize: 13)),
          Text(
            "Register Institution",
            style: TextStyle(
              fontSize: 13,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
