import 'package:flutter/material.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/auth/forgot_pass/successful_screen.dart';
import 'package:hirenearby/widget/labeled_text_field.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 12,
              children: [
                Text(AppStrings.resetPass, style: FontManager.titleText()),
                AppSpacing.h12,
                LabeledTextField(
                  label: AppStrings.enterPassword,
                  hint: AppStrings.passHint,
                ),
                LabeledTextField(
                  label: AppStrings.confirmPassword,
                  hint: AppStrings.passHint,
                ),
                AppSpacing.h12,
                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessfulScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppStrings.continueButton,
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
