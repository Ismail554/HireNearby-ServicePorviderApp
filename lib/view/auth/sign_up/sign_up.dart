import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/view/auth/auth_screen.dart';
import 'package:hirenearby/validators/signup_validator.dart';
import 'package:hirenearby/view/auth/login/login_screen.dart';
import 'package:hirenearby/widget/labeled_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isChecked = false;

  // Validation error messages
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _checkboxError;

  void _handleSubmit() {
    // Validate all fields
    setState(() {
      _nameError = SignupValidation.validateName(_nameController.text);
      _emailError = SignupValidation.validateEmail(_emailController.text);
      _passwordError = SignupValidation.validatePassword(
        _passwordController.text,
      );
      _confirmPasswordError = SignupValidation.validateConfirmPassword(
        _confirmPasswordController.text,
        _passwordController.text,
      );
      _checkboxError = SignupValidation.validateCheckbox(_isChecked);
    });

    // Check if all validations pass
    if (_nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null &&
        _checkboxError == null) {
      // All validations passed, proceed with sign up
      // TODO: Implement sign up logic here
      print('Sign up successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false, // for removing the back icon
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 12.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.signUP, style: FontManager.titleText()),
                AppSpacing.h20,
                // Name
                LabeledTextField(
                  controller: _nameController,
                  label: AppStrings.fullName,
                  hint: AppStrings.fullNameHint,
                  errorText: _nameError,
                  onChanged: (value) {
                    if (_nameError != null) {
                      setState(() {
                        _nameError = SignupValidation.validateName(value);
                      });
                    }
                  },
                ),
                //email
                LabeledTextField(
                  controller: _emailController,
                  label: AppStrings.email,
                  hint: AppStrings.emailHint,
                  errorText: _emailError,
                  onChanged: (value) {
                    if (_emailError != null) {
                      setState(() {
                        _emailError = SignupValidation.validateEmail(value);
                      });
                    }
                  },
                ),
                //password
                LabeledTextField(
                  controller: _passwordController,
                  label: AppStrings.password,
                  hint: AppStrings.passHint,
                  isPassword: true,
                  errorText: _passwordError,
                  onChanged: (value) {
                    // Real-time password match validation
                    if (_passwordError != null) {
                      setState(() {
                        _passwordError = SignupValidation.validatePassword(
                          value,
                        );
                      });
                    }
                    // Check confirm password match in real-time
                    if (_confirmPasswordController.text.isNotEmpty) {
                      setState(() {
                        _confirmPasswordError =
                            SignupValidation.validateConfirmPassword(
                              _confirmPasswordController.text,
                              value,
                            );
                      });
                    }
                  },
                ),
                // Confirm password
                LabeledTextField(
                  controller: _confirmPasswordController,
                  label: AppStrings.confirmPassword,
                  hint: AppStrings.passHint,
                  isPassword: true,
                  errorText: _confirmPasswordError,
                  onChanged: (value) {
                    // Real-time password match validation
                    if (_confirmPasswordError != null || value.isNotEmpty) {
                      setState(() {
                        _confirmPasswordError =
                            SignupValidation.validateConfirmPassword(
                              value,
                              _passwordController.text,
                            );
                      });
                    }
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue ?? false;
                              if (_checkboxError != null) {
                                _checkboxError =
                                    SignupValidation.validateCheckbox(
                                      _isChecked,
                                    );
                              }
                            });
                          },
                          activeColor: Colors.blue, // Color when checked
                          checkColor: Colors.white, // Color of the checkmark
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        // Condition text
                        Expanded(
                          child: Text(
                            AppStrings.condition,
                            style: FontManager.subSubtitleText(),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    // Checkbox error message
                    if (_checkboxError != null &&
                        _checkboxError!.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          _checkboxError!,
                          style: TextStyle(color: AppColors.red, fontSize: 12),
                        ),
                      ),
                    ],
                  ],
                ),
                AppSpacing.h4,
                // sign up button
                FilledButton(
                  onPressed: _handleSubmit,
                  child: Text(
                    AppStrings.signUP,
                    style: FontManager.buttonText(),
                  ),
                ),
                // Already have an account? Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveAccount,
                      style: FontManager.subtitleText(),
                    ),
                    AppSpacing.w4,
                    // Sign in text button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.signIN,
                        style: FontManager.subtitleText(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
                // Bottom divider with text
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyD9)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or Continue with',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.greyD9)),
                  ],
                ),
                // Login with Google
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.black, width: 1.r),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/google.png",
                        fit: BoxFit.fill,
                        height: 32.h,
                      ),
                      AppSpacing.w4,
                      Text(
                        "Google",
                        style: FontManager.generalText(color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
