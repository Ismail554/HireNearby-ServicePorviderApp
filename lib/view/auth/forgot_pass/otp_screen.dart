import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/assets_manager.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/widget/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _resendTimer = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _resendTimer = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  void _handleResendCode() {
    if (_canResend) {
      // TODO: Implement resend OTP logic
      _startTimer();
    }
  }

  void _handleOtpCompleted(String pin) {
    // TODO: Implement OTP verification logic
    debugPrint('OTP entered: $pin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.otpAuth,
                    style: FontManager.titleText(),
                  ),
                ),
                AppSpacing.h16,
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(SvgAssets.otpIcon, height: 121.h),
                      AppSpacing.h16,
                      Text(
                        AppStrings.otpAuthInstruction,
                        style: FontManager.HintText(),
                        textAlign: TextAlign.center,
                      ),
                      AppSpacing.h32,
                      Center(
                        child: CustomPinput(
                          onCompleted: _handleOtpCompleted,
                          length: 4,
                        ),
                      ),
                      AppSpacing.h24,
                      Center(
                        child: GestureDetector(
                          onTap: _canResend ? _handleResendCode : null,
                          child: Text(
                            _canResend
                                ? 'Resend new code'
                                : 'Resend new code ($_resendTimer)',
                            style: FontManager.HintText(
                              fontSize: 14,
                              color: _canResend
                                  ? AppColors.primaryColor
                                  : AppColors.hintTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.h12,
                FilledButton(onPressed: () {}, child: Text(AppStrings.verify)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
