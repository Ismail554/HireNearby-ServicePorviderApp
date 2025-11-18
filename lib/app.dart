import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/view/splash_screen/splash_screen.dart';

class HireNearbyApp extends StatelessWidget {
  const HireNearbyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: ThemeData(
            colorSchemeSeed: Colors.amber,
            inputDecorationTheme: InputDecorationTheme(),
            //Filled Button theme
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                fixedSize: Size(double.maxFinite, 52.h),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: AppColors.defTextColor,
              ),
            ),
            //Outlined Button theme
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.defTextColor,
                fixedSize: Size(double.maxFinite, 52.h),
                side: BorderSide(color: AppColors.white, width: 2.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
