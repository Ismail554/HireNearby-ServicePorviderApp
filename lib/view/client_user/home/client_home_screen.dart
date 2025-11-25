import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/client_user/home/custom_service_list.dart';
import 'package:hirenearby/widget/common_screen_setup.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: .center,
        spacing: 12.h,
        children: [
          Stack(
            children: [
              // Full background SVG
              SizedBox(
                height: 460.h,
                width: double.maxFinite,
                child: Image.asset(ImageAssets.authBg, fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  spacing: 12.h,
                  children: [
                    //Top bar
                    AppSpacing.h12,
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Image.asset(ImageAssets.appLogoWhite, height: 40.h),
                        Icon(
                          Icons.notifications,
                          size: 28.h,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    // end of top bar
                    AppSpacing.h20,
                    Center(
                      child: Text(
                        AppStrings.findTrusted,
                        textAlign: .center,
                        overflow: TextOverflow.visible,
                        style: FontManager.bigTitleText(color: AppColors.white),
                      ),
                    ),
                    Text(
                      AppStrings.connectWithVerified,
                      textAlign: .center,
                      style: FontManager.generalText(color: AppColors.white),
                    ),
                    AppSpacing.h24,
                    // top search box
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                fillColor: AppColors.white,
                                // border:1,
                                // focusedBorder: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey[200]!,
                                    width: 1.w,
                                  ),
                                ),
                                filled: true,

                                hintText: 'Search for services',
                                prefixIcon: Icon(Icons.search, size: 28.h),
                              ),
                            ),
                            AppSpacing.h12,
                            FilledButton.icon(
                              // <-- Use the .icon constructor
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                minimumSize: Size(double.maxFinite, 48.h),
                                backgroundColor: Colors.orange[700],
                              ),
                              icon: Icon(
                                Icons.search,
                                size: 24.h,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Search",
                                style: FontManager.buttonText(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // end of search box
                  ],
                ),
              ),
            ],
          ),

          //end of top stack
          // Rest of the home screen content goes here
          Text("Popular Services", style: FontManager.titleText(fontSize: 30)),
          Text(
            "Browse by category to find the right professional for you",
            style: FontManager.generalText(),
            textAlign: .center,
          ),
          AppSpacing.h10,
          // catagory grid view
          ServicesListOptimized(),
        ],
      ),
    );
  }
}
