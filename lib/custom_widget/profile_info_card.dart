import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/assets_manager.dart';

class ProfileInfoCard extends StatelessWidget {
  final String name;
  final String profession;
  final String location;

  const ProfileInfoCard({
    super.key,
    required this.name,
    required this.profession,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 32.r,
            backgroundColor: Colors.grey.shade200,
            child: Image.asset(ImageAssets.profile, fit: BoxFit.fill),
          ),

          AppSpacing.w12,

          // Name, profession, location
          Expanded(
            // Added Expanded to prevent overflow if text is too long
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    AppSpacing.w6,
                    Image.asset(IconAssets.verfied, width: 16.w, height: 16.h),
                  ],
                ),

                AppSpacing.h4,
                Row(
                  children: [
                    Icon(Icons.work_outline, color: Colors.grey, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      profession,
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ),

                AppSpacing.h2,
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 16.sp,
                    ),

                    AppSpacing.w4,
                    Text(
                      location,
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
