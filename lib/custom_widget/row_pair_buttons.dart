import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowPairButtons extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  final Color leftBorderColor;
  final Color rightBgColor;
  final Color leftTextColor;
  final Color rightTextColor;

  const RowPairButtons({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onLeftTap,
    required this.onRightTap,
    this.leftBorderColor = Colors.black,
    this.rightBgColor = Colors.deepOrange,
    this.leftTextColor = Colors.black,
    this.rightTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: leftBorderColor),
              fixedSize: Size(126.w, 36.h),
            ),
            onPressed: onLeftTap,
            child: Text(leftText, style: TextStyle(color: leftTextColor)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: rightBgColor,
              fixedSize: Size(126.w, 36.h),
            ),
            onPressed: onRightTap,
            child: Text(
              rightText,
              style: TextStyle(color: rightTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
