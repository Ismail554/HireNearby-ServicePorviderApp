import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/custom_widget/row_pair_buttons.dart';
import 'package:hirenearby/custom_widget/tag_display.dart';
import 'package:hirenearby/custom_widget/universal_card.dart';
import 'package:hirenearby/view/client_user/home/directory/custom_Avaibility_card.dart';
import 'package:hirenearby/view/client_user/home/directory/select_time_screen.dart';

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
            AppSpacing.h12,
            // button Section
            RowPairButtons(
              leftText: "Chat",
              rightText: "Book Now",
              onLeftTap: () {},
              onRightTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectTimeScreen()),
                );
              },
            ),
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
      "thu": false,
      "fri": true,
      "sat": false,
      "sun": true,
    };

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: AvailabilityCard(availability: availability),
    );
  }

  /// ---------------- REVIEW SECTION ----------------
  Widget _reviewSection() {
    // Dummy review data
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'Alex Thompson',
        'profileImage': ImageAssets.profile,
        'rating': 3,
        'date': 'Nov 10, 2025',
        'review':
            'Execellent service! Very professional and thorough. Highly recommend!',
      },
      {
        'name': 'Sabbir Megas',
        'profileImage': ImageAssets.profile,
        'rating': 5,
        'date': 'Nov 10, 2025',
        'review':
            'Execellent service! Very professional and thorough. Highly recommend!',
      },
    ];

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 0.8,
            color: AppColors.amberTransparent,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Reviews', style: FontManager.titleText()),
              Text(
                "See all",
                style: FontManager.HintText(color: AppColors.blue),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...reviews.map((review) => _buildReviewCard(review)),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: .start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              ClipOval(
                child: Image.asset(
                  review['profileImage'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey.shade300,
                      child: Icon(
                        Icons.person,
                        size: 25.sp,
                        color: Colors.grey.shade600,
                      ),
                    );
                  },
                ),
              ),

              AppSpacing.w12,
              // Review Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name, Rating, Date Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            review['name'],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          review['date'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    // Stars Rating
                    Row(
                      children: List.generate(
                        review['rating'],
                        (index) =>
                            Icon(Icons.star, size: 16.sp, color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Review Text
                  ],
                ),
              ),
            ],
          ),
          Text(
            review['review'],
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
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
