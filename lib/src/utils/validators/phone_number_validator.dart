String? phoneNumberValidator(String? val) {
  bool isValid = validate(val ?? '');
  if (isValid) {
    return null;
  }
  return 'Please enter a valid phone number';
}

bool validate(String val) {
  if (val.length == 10) {
    bool b = RegExp(r'^[0-9]+$').hasMatch(val);
    return b;
  }
  return false;
}
