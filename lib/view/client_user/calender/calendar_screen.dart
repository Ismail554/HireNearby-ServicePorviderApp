import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/font_manager.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Calendar', style: FontManager.titleText()),
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 80.h, color: Colors.grey),
            SizedBox(height: 16.h),
            Text('Calendar', style: FontManager.titleText(fontSize: 24)),
            SizedBox(height: 8.h),
            Text(
              'Your appointments and schedule will appear here',
              style: FontManager.generalText(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
