import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
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
      body: Column(
        children: [
          Stack(
            children: [
              // Full background SVG
              SizedBox(
                height: 500.h,
                width: double.maxFinite,
                child: Image.asset(ImageAssets.authBg, fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  spacing: 12.h,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading:
                          false, // for removing the back icon
                      elevation: 1,
                      title: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 32.h,
                          horizontal: 2.w,
                        ),
                        child: Row(
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
                      ),
                    ),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                // border:1,
                                // focusedBorder: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 1.5,
                                  ),
                                ),
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
        ],
      ),
    );
  }
}
