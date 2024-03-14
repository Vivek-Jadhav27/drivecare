String? ageValidator(String? val) {
  bool isValid = validate(val ?? '');
  if (isValid) {
    return null;
  }
  return 'Please enter a valid age';
}

validate(String val) {
  try {
    int age = int.parse(val);

    return age > 0 && age <= 150;
  } catch (e) {
    return false;
  }
}
