String? emailValidator(String? val) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(val ?? '');
  if (emailValid) {
    return null;
  }
  return 'Please enter a valid email';
}
