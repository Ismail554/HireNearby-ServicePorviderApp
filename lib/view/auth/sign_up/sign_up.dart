import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/app_colors.dart';
import 'package:hirenearby/core/app_spacing.dart';
import 'package:hirenearby/core/app_strings.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/validators/signup_validator.dart';
import 'package:hirenearby/view/auth/auth_screen.dart';
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

  // Error messages for each field
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  // Validate individual fields - NOW WITH STRING PARAMETER
  void _validateName(String value) {
    setState(() {
      _nameError = SignupValidation.validateName(_nameController.text);
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _emailError = SignupValidation.validateEmail(_emailController.text);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _passwordError = SignupValidation.validatePassword(
        _passwordController.text,
      );
      // Also validate confirm password when password changes
      if (_confirmPasswordController.text.isNotEmpty) {
        _validateConfirmPassword(_confirmPasswordController.text);
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      _confirmPasswordError = SignupValidation.validateConfirmPassword(
        _confirmPasswordController.text,
        _passwordController.text,
      );
    });
  }

  // Function to handle form submission
  void _submitForm() {
    // Validate all fields using bulk validation
    final errors = SignupValidation.validateAllFields(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    // Update UI with errors
    setState(() {
      _nameError = errors['name'];
      _emailError = errors['email'];
      _passwordError = errors['password'];
      _confirmPasswordError = errors['confirmPassword'];
    });

    // Check if any field has error
    final hasFieldErrors =
        _nameError != null ||
        _emailError != null ||
        _passwordError != null ||
        _confirmPasswordError != null;

    if (hasFieldErrors) {
      return; // Don't proceed if there are field errors
    }

    // Check checkbox only on submit using validation class
    final checkboxError = SignupValidation.validateCheckbox(_isChecked);
    if (checkboxError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(checkboxError)));
      return;
    }

    // If all validations pass
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Processing Data')));

    // TODO: Add your signup API call here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.signUP, style: FontManager.titleText()),
                AppSpacing.h20,

                // Name Field with Error
                _buildTextFieldWithError(
                  controller: _nameController,
                  label: AppStrings.fullName,
                  hint: AppStrings.fullNameHint,
                  errorText: _nameError,
                  onChanged:
                      _validateName, // Now correctly passes String parameter
                ),

                // Email Field with Error
                _buildTextFieldWithError(
                  controller: _emailController,
                  label: AppStrings.email,
                  hint: AppStrings.emailHint,
                  errorText: _emailError,
                  onChanged:
                      _validateEmail, // Now correctly passes String parameter
                ),

                // Password Field with Error
                _buildTextFieldWithError(
                  controller: _passwordController,
                  label: AppStrings.password,
                  hint: AppStrings.passHint,
                  errorText: _passwordError,
                  onChanged:
                      _validatePassword, // Now correctly passes String parameter
                  isPassword: true,
                ),

                // Confirm Password Field with Error
                _buildTextFieldWithError(
                  controller: _confirmPasswordController,
                  label: AppStrings.confirmPassword,
                  hint: AppStrings.passHint,
                  errorText: _confirmPasswordError,
                  onChanged:
                      _validateConfirmPassword, // Now correctly passes String parameter
                  isPassword: true,
                ),

                // Terms and Conditions Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        AppStrings.condition,
                        style: FontManager.subSubtitleText(),
                      ),
                    ),
                  ],
                ),

                AppSpacing.h20,

                // Submit Button
                FilledButton(
                  onPressed: _submitForm,
                  child: Text(AppStrings.signUP),
                ),

                // Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveAccount,
                      style: FontManager.subtitleText(),
                    ),
                    AppSpacing.w4,
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthScreen()),
                      ),
                      child: Text(
                        AppStrings.signIN,
                        style: FontManager.subtitleText(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),

                // Divider
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

                // Google Sign In
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

  // Helper widget to show text field with error
  Widget _buildTextFieldWithError({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String? errorText,
    required Function(String) onChanged, // Correct type: Function(String)
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledTextField(
          controller: controller,
          label: label,
          hint: hint,
          isPassword: isPassword,
          onChanged: onChanged, // This should now work correctly
        ),
        if (errorText != null) ...[
          SizedBox(height: 4.h),
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
        ],
        SizedBox(height: 12.h),
      ],
    );
  }
}
