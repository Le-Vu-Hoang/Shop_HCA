class Validation{
  static bool isValidationEmail (String email) {
    // Regular expression for validating an email address
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidationPassword(String password) {
    // Password must be at least 8 characters long, contain at least one uppercase letter,
    // one lowercase letter, one digit, and one special character
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }
}