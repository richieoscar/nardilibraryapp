import 'package:email_validator/email_validator.dart';

class Validate {
  static bool passwordMatch(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }

  static bool isValidLength(String password, String confirmPassword) {
    if (password.length < 6 || confirmPassword.length < 6) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }
}
