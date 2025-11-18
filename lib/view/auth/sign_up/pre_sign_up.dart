import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';

class PreSignUp extends StatelessWidget {
  const PreSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/auth_bg.png", fit: BoxFit.cover),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 24.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/logo.png')),
                  AppSpacing.h96,
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(AppStrings.worker),
                  ),
                  //Sign up button
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreSignUp()),
                      );
                    },
                    child: Text(AppStrings.client),
                  ),
                  AppSpacing.h12,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
