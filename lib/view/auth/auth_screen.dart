import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/auth/login/login_screen.dart';
import 'package:hirenearby/view/auth/sign_up/pre_sign_up.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full background SVG
          SizedBox.expand(
            child: Image.asset('assets/images/auth_bg.png', fit: BoxFit.cover),
          ),
          // Logo stacked over the background
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 12.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/logo.png')),
                  AppSpacing.h144,
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(AppStrings.signIN),
                  ),
                  //Sign up button
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreSignUp()),
                      );
                    },
                    child: Text(AppStrings.signUP),
                  ),
                  AppSpacing.h12,
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
                  AppSpacing.h20,
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/google.png",
                          fit: BoxFit.fill,
                          height: 32.h,
                        ),
                        Text("Google"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
