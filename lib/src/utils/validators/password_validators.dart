String? passwordValidator(String? val) {
  bool isStrongPassword(String password) {
    if (password.length < 6) {
      return false;
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    return true;
  }

  if (isStrongPassword(val ?? '')) {
    return null;
  } else {
    return 'Your password must include atleast 6 characters, 1 uppercase letter,1 lowercase letter,1 digit, and 1 special character.';
  }
}
