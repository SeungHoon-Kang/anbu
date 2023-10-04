class AuthValidator {
  static String? isNameValid(String? text) {
    return text != null && text.contains(RegExp(r"[A-Z][a-z]{3}"))
        ? null
        : "Name in not valid";
  }

  static String? isEmailValid(String? text) {
    return text != null && text.contains("@") && text.contains(".")
        ? null
        : "Email in not valid";
  }

  static String? isPasswordValid(String? text) {
    return text != null && text.contains(RegExp(r"[a-z]{3}[0-9]{3}"))
        ? null
        : "Password in not valid";
  }
}
