class NameRules {
  static final RegExp nameRegex = RegExp(
    r'^(?!.*\s{2,})[A-Za-z\u0600-\u06FF]+(?:\s[A-Za-z\u0600-\u06FF]+)*$',
  );

  static bool hasValidLength(String name) {
    return name.length >= 3 && name.length <= 50;
  }

  static bool isValidCharacters(String name) {
    return nameRegex.hasMatch(name);
  }
}

class EmailRules {
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isValidEmail(String email) {
    return emailRegex.hasMatch(email);
  }
}

class PasswordRules {
  static bool hasValidLength(String password) {
    return password.length >= 8 && password.length <= 64;
  }

  static bool hasUpperAndLowerCase(String password) {
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    return hasUpper && hasLower;
  }

  static bool hasDigit(String password) {
    return password.contains(RegExp(r'\d'));
  }

  static bool hasSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#\$&*~]'));
  }

  static bool hasNoSpaces(String password) {
    return !password.contains(RegExp(r'\s'));
  }
}
