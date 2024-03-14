import 'package:flutter/material.dart';

import '../../../domain/repository/firebase_repository.dart';

class AdminSignUpProvider extends ChangeNotifier {
  String? garagename;
  String? name;
  String? email;
  String? phone;
  String? password;
  BuildContext? context;

  void getGaragename(String val) {
    garagename = val;
    notifyListeners();
  }

  void getName(String val) {
    name = val;
    notifyListeners();
  }

  void getEmailId(String val) {
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

  void getContext(BuildContext val) {
    context = val;
    notifyListeners();
  }

  Future<bool> onSubmit() async {
    bool isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? '');
    
    if ((email != null && isValidEmail) && (password != null)) {
      await FirebaseRepository.signupAdmin(garagename!, email!, password!,phone! , context!);
    }
    return false;
  }
}
