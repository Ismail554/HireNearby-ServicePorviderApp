// utils/validations/validation_service.dart
class ValidationService {
  // Generic validations that can be used across the app
  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "Please enter $fieldName";
    }
    return null;
  }

  static String? validateEmailFormat(String? value) {
    if (value == null || value.isEmpty) return "Please enter email";
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) return "Please enter $fieldName";
    if (value.length < minLength) {
      return "$fieldName must be at least $minLength characters";
    }
    return null;
  }
}