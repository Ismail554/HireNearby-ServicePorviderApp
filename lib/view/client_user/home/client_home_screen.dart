import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <--- CHANGE 1: Import this for SystemNavigator
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/custom_service_list.dart';
import 'package:hirenearby/custom_widget/adaptive_photo_grid.dart';
import 'package:hirenearby/view/client_user/home/directory/directory_screen.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  // <--- CHANGE 2: Add this variable to track time
  DateTime? currentBackPressTime;

  static const List<ServiceItem> services = [
    ServiceItem('Handyman', Icons.build, Color(0xFFDDE9FF)),
    ServiceItem('Cleaning', Icons.cleaning_services, Color(0xFFD6F6FF)),
    ServiceItem('Moving', Icons.local_shipping, Color(0xFFFFE1E6)),
    ServiceItem('Home Care', Icons.home, Color(0xFFE3F6D9)),
  ];

  @override
  Widget build(BuildContext context) {
    // <--- CHANGE 3: Wrap Scaffold with PopScope
    return PopScope(
      canPop: false, // Stop the immediate back action
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        // Logical check: User pressed back just now?
        final now = DateTime.now();

        // If user hasn't pressed back before OR passed 2 seconds since last press
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          // Update the time
          currentBackPressTime = now;

          // Show the Warning (Snackbar)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Press back again to exit',
                style: FontManager.generalText(color: Colors.white),
              ),
              backgroundColor: Colors.black87,
              duration: const Duration(seconds: 2),
            ),
          );
        } else {
          // If user pressed within 2 seconds -> Close the App
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // spacing: 12.h, // Note: 'spacing' is new in Flutter 3.24 Column, make sure your flutter is updated or remove it if getting errors
            children: [
              Stack(
                children: [
                  // Full background SVG
                  SizedBox(
                    height: 430.h,
                    width: double.maxFinite,
                    child: Image.asset(ImageAssets.authBg, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // spacing: 12.h,
                      children: [
                        //Top bar
                        AppSpacing.h36,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        AppSpacing.h12,
                        Center(
                          child: Text(
                            AppStrings.findTrusted,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            style: FontManager.bigTitleText(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        AppSpacing.h12,
                        Text(
                          AppStrings.connectWithVerified,
                          textAlign: TextAlign.center,
                          style: FontManager.generalText(
                            color: AppColors.white,
                          ),
                        ),
                        AppSpacing.h12,
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
                                    fillColor: AppColors.white,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // spacing: 12.h,
                  children: [
                    Text(
                      "Popular Services",
                      style: FontManager.titleText(fontSize: 30),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Browse by category to find the right professional for you",
                      style: FontManager.generalText(),
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.h10,
                    // catagory grid view
                    ServicesListOptimized(
                      services: services,
                      onServiceTap: (service) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DirectoryScreen(title: service.name),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12.h),
                    // Explore
                    Text(
                      "Explore Pros Worker",
                      style: FontManager.titleText(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Browse by category to find the right professional for you",
                      style: FontManager.generalText(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                    AppSpacing.h10,
                    // Photo catagory container
                    AdaptivePhotoGrid(
                      images: [
                        ImageAssets.homeService1,
                        ImageAssets.homeService2,
                        ImageAssets.homeService3,
                        ImageAssets.homeService4,
                        ImageAssets.homeService5,
                        ImageAssets.homeService6,
                        ImageAssets.homeService7,
                        ImageAssets.homeService8,
                        ImageAssets.homeService9,
                        ImageAssets.homeService10,
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Top Rated Professionals",
                      style: FontManager.titleText(fontSize: 30),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Browse by category to find the right professional for you",
                      style: FontManager.generalText(),
                      textAlign: TextAlign.center,
                    ),
                    // Photo catagory container
                    AdaptivePhotoGrid(
                      images: [
                        ImageAssets.homeService5,
                        ImageAssets.homeService2,
                        ImageAssets.homeService7,
                        ImageAssets.homeService8,
                        ImageAssets.homeService9,
                        ImageAssets.homeService3,
                        ImageAssets.homeService4,
                        ImageAssets.homeService6,
                        ImageAssets.homeService1,
                        ImageAssets.homeService10,
                      ],
                    ),
                    AppSpacing.h60,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
