import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailabilityCard extends StatelessWidget {
  final Map<String, bool> availability; 

  const AvailabilityCard({
    super.key,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    final dayLabels = ["M", "T", "W", "T", "F", "S", "S"];
    final dayKeys    = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title Row
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 20, color: Colors.black87),
              SizedBox(width: 8),
              Text(
                "Availability",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// Day labels (M T W T F S S)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var lbl in dayLabels)
                Text(lbl, style: TextStyle(fontSize: 14.sp)),
            ],
          ),

          SizedBox(height: 8.h),

          /// Colored badges row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dayKeys.length, (index) {
              bool isAvailable = availability[dayKeys[index]] ?? false;

              return Container(
                width: 26.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: isAvailable ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            }),
          ),

          SizedBox(height: 10.h),
          Text(
            "Green indicates available days",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
