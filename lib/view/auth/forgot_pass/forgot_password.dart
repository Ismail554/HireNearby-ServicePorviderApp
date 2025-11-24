import 'package:flutter/material.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/auth/forgot_pass/otp_screen.dart';
import 'package:hirenearby/widget/labeled_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.forgotPassword, style: FontManager.titleText()),
                AppSpacing.h20,
                LabeledTextField(
                  label: AppStrings.validEmail,
                  hint: AppStrings.emailHint,
                ),
                AppSpacing.h24,
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScreen()),
                    );
                  },
                  child: Center(child: Text(AppStrings.continueButton)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
