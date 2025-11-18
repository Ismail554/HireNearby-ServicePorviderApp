// utils/validations/signup_validation.dart
class SignupValidation {
  // Field validation methods
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Setup a strong password";
    }
    return null;
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
      return "You didn't accept our Terms and Condition";
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