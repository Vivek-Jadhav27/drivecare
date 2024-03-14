import 'package:flutter/material.dart';

class CustomerProfileProvider extends ChangeNotifier {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? profilepic;

  void getName(String val) {
    name = val;
    notifyListeners();
  }

  void getEmail(String val) {
    email = val;
    notifyListeners();
  }

  void getPhone(String val) {
    phone = val;
    notifyListeners();
  }

  void getPassword(String val) {
    password = val;
    notifyListeners();
  }

  void getProfilePic(String val) {
    profilepic = val;
    notifyListeners();
  }

  void updateProfile() {}
  
}
