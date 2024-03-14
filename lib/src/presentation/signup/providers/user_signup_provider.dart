// import 'dart:js';
import 'package:drivecare/src/domain/repository/firebase_repository.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserSignUpProvider extends ChangeNotifier {
  String? name;
  String? email;
  String? password;
  String? phone;
  BuildContext? context;

  getName(String val) {
    name = val;
    notifyListeners();
  }

  getEmail(String val) {
    email = val;
    notifyListeners();
  }

  getPassword(String val) {
    password = val;
    notifyListeners();
  }

  getPhone(String val) {
    phone = val;
    notifyListeners();
  }

  getContext(BuildContext val){
    context = val;
    notifyListeners();
  }
  Future<bool> onSubmit() async {
    bool isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? '');
    if ((name != null) &&
        (email != null && isValidEmail) &&
        (phone != null) &&
        (password != null)) {
      await FirebaseRepository.signupUser(name!,email!,password!,phone! ,context!);
    }
    return false;
  }
}
