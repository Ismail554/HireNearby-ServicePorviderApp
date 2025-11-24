import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/font_manager.dart';

class CustomPinput extends StatefulWidget {
  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final int length;
  final String? Function(String?)? validator;

  const CustomPinput({
    super.key,
    this.onCompleted,
    this.onChanged,
    this.length = 4,
    this.validator,
  });

  @override
  State<CustomPinput> createState() => _CustomPinputState();
}

class _CustomPinputState extends State<CustomPinput> {
  late final TextEditingController _pinController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: FontManager.generalText(fontSize: 22, color: AppColors.black),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor),
      ),
    );

    return Pinput(
      length: widget.length,
      controller: _pinController,
      focusNode: _focusNode,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => SizedBox(width: 8.w),
      validator: widget.validator,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 9.h),
            width: 22.w,
            height: 1.h,
            color: AppColors.primaryColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.red),
        ),
      ),
    );
  }
}
