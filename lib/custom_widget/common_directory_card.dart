import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/custom_widget/row_pair_buttons.dart';
import 'package:hirenearby/view/client_user/home/directory/contractor_profile_screen.dart';
import 'package:hirenearby/view/client_user/home/directory/select_time_screen.dart';

class CommonDirectoryCard extends StatelessWidget {
  const CommonDirectoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to contractor profile screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContractorProfileScreen()),
        );
      },
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            /// ---------- PROFILE + DETAILS ROW ----------
            Row(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                /// Profile Picture
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(ImageAssets.profile),
                ),

                AppSpacing.w12,

                /// All Text Sections
                Expanded(
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      /// Name + Verified Icon
                      Row(
                        children: [
                          Text(
                            "Darlene",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Image.asset(
                            IconAssets.verfied,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      /// Profession + Location
                      Row(
                        children: [
                          Icon(
                            Icons.work_outline,
                            color: Colors.grey,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Plumber Service",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
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
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      /// Experience
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 16.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "3 years experience",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      /// Rating + Price
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18.sp,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "4.9 (128)",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$45",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: " per hour ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      /// Jobs Completed
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 17.sp,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "321",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Jobs Completed",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            AppSpacing.h16,

// Pair buttons
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
}
