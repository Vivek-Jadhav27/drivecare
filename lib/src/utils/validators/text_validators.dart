String? textValidator(String? val) {
  if ((val ?? '').trim().isNotEmpty) {
    return null;
  }
  return '';
}
