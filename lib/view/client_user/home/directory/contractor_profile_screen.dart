import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/custom_widget/tag_display.dart';
import 'package:hirenearby/custom_widget/universal_card.dart';
import 'package:hirenearby/view/client_user/home/directory/custom_Avaibility_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/view/client_user/home/directory/custom_Avaibility_card.dart';

class ContractorProfileScreen extends StatefulWidget {
  const ContractorProfileScreen({super.key});

  @override
  State<ContractorProfileScreen> createState() =>
      _ContractorProfileScreenState();
}

class _ContractorProfileScreenState extends State<ContractorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      showBackButton: true,
      title: AppStrings.contractorProfile,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1st name card
            _topNameCard(),
            // Second availability card
            _availabilityCard(),
            // Third row
            _thirdRow(),
            // fourth Row
            _skillTag(),
            // review
            _reviewSection(),
          ],
        ),
      ),
    );
  }

  /// ---------------- TOP NAME CARD ----------------
  Widget _topNameCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: Colors.grey.shade200,
            child: Image.asset(ImageAssets.profile, fit: BoxFit.fill),
          ),

          AppSpacing.w12,

          // Name, profession, location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Mika Watt",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Image.asset(IconAssets.verfied, width: 16.w, height: 16.h),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.work_outline, color: Colors.grey, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    "Plumber Service",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "America",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------------- AVAILABILITY CARD ----------------
  Widget _availabilityCard() {
    final Map<String, bool> availability = {
      "mon": true,
      "tue": false,
      "wed": true,
      "thu": true,
      "fri": false,
      "sat": false,
      "sun": false,
    };

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: AvailabilityCard(availability: availability),
    );
  }
  
  _reviewSection() {}
}

Widget _skillTag() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      spacing: 12.h,
      children: [
        Row(
          spacing: 6.w,
          children: [
            Icon(Icons.psychology_outlined),
            Text("Skills", style: FontManager.titleText()),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8.w,
            children: [
              TagDisplay(text: "Pipe Repair"),
              TagDisplay(text: "Installation"),
              TagDisplay(text: "Leak Detection"),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _thirdRow() {
  return SizedBox(
    width: double.maxFinite,
    child: Row(
      spacing: 8.w,
      children: [
        Expanded(
          child: UniversalCard(value: r"$45", label: "Per Hour"),
        ),
        Expanded(
          child: UniversalCard(label: "Jobs Done", value: "127"),
        ),
        Expanded(
          child: UniversalCard(label: "Experience", value: "3 Years"),
        ),
      ],
    ),
  );
}

/// -----------------------
/// TOP NAME CARD
/// -----------------------
Widget _topNameCard() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),

    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 4.w,
        children: [
          CircleAvatar(child: Image.asset(ImageAssets.profile), radius: 30.r),

          SizedBox(width: 10.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Mika Watt",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Image.asset(IconAssets.verfied, width: 16.w, height: 16.h),
                ],
              ),

              SizedBox(height: 4.h),

              Row(
                children: [
                  Icon(Icons.work_outline, color: Colors.grey, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    "Plumber Service",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),

                  SizedBox(width: 12.w),

                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),

                  Text(
                    "America",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
