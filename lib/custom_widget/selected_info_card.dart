import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable card used to display a selected value such as
/// a date or time with a title.
///
/// Example:
/// ```dart
/// SelectedInfoCard(
///   title: "Selected Date",
///   value: "Thursday, November 27, 2025",
/// )
/// ```
class SelectedInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const SelectedInfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
