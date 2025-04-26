

// lib/utils/regex_validator.dart

class RegexValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    final RegExp emailRegExp =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'enter valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (value.length < 6) {
      return 'Password minimum 6 character ';
    }
    return null;
  }
}
