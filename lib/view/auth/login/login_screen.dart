import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/auth/auth_screen.dart';
import 'package:hirenearby/view/auth/forgot_pass/forgot_password.dart';
import 'package:hirenearby/view/auth/sign_up/pre_sign_up.dart';
import 'package:hirenearby/view/client_user/home/client_home_screen.dart';
import 'package:hirenearby/widget/labeled_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false, // for removing the back icon
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 12.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.signIN, style: FontManager.titleText()),
                AppSpacing.h20,
                // Name
                LabeledTextField(
                  // controller: ,
                  label: AppStrings.enterEmail,
                  hint: AppStrings.fullNameHint,
                  // errorText: ,
                  // onChanged: (value) {
                  //   if (_nameError != null) {
                  //     setState(() {
                  //       _nameError = SignupValidation.validateName(value);
                  //     });
                  //   }
                  // },
                ),
                //email
                LabeledTextField(
                  // controller: ,
                  label: AppStrings.enterPassword,
                  hint: AppStrings.passHint,
                  // errorText: ,
                  // onChanged: (value) {
                  //   if (_emailError != null) {
                  //     setState(() {
                  //       _emailError = SignupValidation.validateEmail(value);
                  //     });
                  //   }
                  // },
                ),
                //Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style: FontManager.HintText().copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ),
                AppSpacing.h12,
                // Sign in button
                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClientHomeScreen(),
                      ),
                    );
                  },
                  child: Center(child: Text(AppStrings.signIN)),
                ),
                AppSpacing.h12,
                // Don't have an account? Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: FontManager.subtitleText(),
                    ),
                    AppSpacing.w4,
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PreSignUp(),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.signUP,
                        style: FontManager.subtitleText(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
                AppSpacing.h8,
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyD9)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or Continue with',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.greyD9)),
                  ],
                ),
                // Login with Google
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.black, width: 1.r),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/google.png",
                        fit: BoxFit.fill,
                        height: 32.h,
                      ),
                      AppSpacing.w4,
                      Text(
                        "Google",
                        style: FontManager.generalText(color: AppColors.black),
                      ),
                    ],
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
