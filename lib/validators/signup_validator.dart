// utils/validations/signup_validation.dart
import 'validation_service.dart';

class SignupValidation {
  // Field validation methods
  static String? validateName(String? value) {
    return ValidationService.validateNotEmpty(value, "name");
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    // Use ValidationService for email format validation
    return ValidationService.validateEmailFormat(value);
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Setup a strong password";
    }
    // Use ValidationService for minimum length validation
    return ValidationService.validateMinLength(value, 6, "password");
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != password) {
      return "Password didn't match";
    }
    return null;
  }

  static String? validateCheckbox(bool isChecked) {
    if (!isChecked) {
      return "To create a account you need to accept our Terms and Condition.";
    }
    return null;
  }

  // Bulk validation for submit
  static Map<String, String?> validateAllFields({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return {
      'name': validateName(name),
      'email': validateEmail(email),
      'password': validatePassword(password),
      'confirmPassword': validateConfirmPassword(confirmPassword, password),
    };
  }
}
