import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/auth/login/login_screen.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 18,
              crossAxisAlignment: .center,
              children: [
                AppSpacing.h32,
                Icon(Icons.check_circle_rounded, color: Colors.blue, size: 100),
                Text(
                  AppStrings.passResetSuccess,
                  style: FontManager.titleText().copyWith(
                    fontSize: 26.sp,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppStrings.passResetCongInstruction,
                  style: FontManager.HintText().copyWith(letterSpacing: 1),
                  textAlign: .center,
                ),
                AppSpacing.h24,
                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    AppStrings.goToLogin,
                    style: FontManager.buttonText(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
