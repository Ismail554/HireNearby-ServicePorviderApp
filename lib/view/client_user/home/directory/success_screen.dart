import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/custom_widget/profile_info_card.dart';
import 'package:hirenearby/view/client_user/home/directory/confirm_booking_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      showBackButton: false,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset(IconAssets.success, width: 74.w, height: 74.h),
          AppSpacing.h12,
          Text(
            "Your Booking request has been successfully sent.",
            style: FontManager.titleText(),
            textAlign: TextAlign.center,
          ),
          AppSpacing.h24,
          ProfileInfoCard(
            showBorder: true,
            backgroundColor: Colors.transparent,
            name: "Plabon Saha",
            profession: "Figma Desiger",
            location: "Dhaka, BD",
          ),
          AppSpacing.h12,
          BookingDetailsCard(
            backgroundColor: Colors.transparent,
            showBorder: true,
            dateValue: 'Wednesday, Nov 17, 2025',
            timeValue: '03:00 PM',
          ),
          AppSpacing.h36,
          OutlinedButton(
            style: FilledButton.styleFrom(
              side: BorderSide(color: Colors.black26, width: 2.r),
              foregroundColor: Colors.black,
            ),
            onPressed: () {},
            child: Row(
              spacing: 6.w,
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.home_outlined, size: 24),
                Text(
                  "Back to Home",
                  style: FontManager.generalText(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.h12,
          FilledButton(
            onPressed: () {},
            child: Row(
              spacing: 6.w,
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.calendar_month, size: 24),
                Text(
                  "Visit My Bookings",
                  style: FontManager.generalText(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
