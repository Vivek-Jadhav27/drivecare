// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../domain/repository/firebase_repository.dart';
// import '../../../domain/repository/firebase_repository.dart';

class LoginProvider extends ChangeNotifier {
  bool isUser = true;
  String? name;
  String? email;
  String? phone;
  String? password;
  bool canSkip = false;
  BuildContext? context;

  void toggleUserAndAdmin(int index) {
    isUser = (index == 0);
    notifyListeners();
  }

  // Future getUserSkipValue() async {
  //   canSkip = !await AdminRepository.getSaveUserValue();
  //   notifyListeners();
  // }

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

  Future<bool> loginAsUser() async {
    bool isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? '');
    if ((email != null && isValidEmail) && (password != null)) {
      await FirebaseRepository.loginUser(email!, password!, context!);
    }
    return false;
  }

  Future<bool> loginAsAdmin() async {
    bool isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? '');
    if ((email != null && isValidEmail) && (password != null)) {
      await FirebaseRepository.loginAdmin(email!, password!, context!);
    }
    return false;
  }


  // Future<bool> loginAsAdmin() async {
  //   if ((email != null) && (password != null)) {
  //     return await AuthRepository.loginAdmin(
  //       email: email!,
  //       password: password!,
  //     );
  //   }
  //   return false;
  // }
  
  // Future<void> loginAsUser() async {
  //   if ((email != null) && (password != null)) {
  //     await FirebaseRepository.loginUser( email!, password!);
  //   }
  // }

  // Future<bool> loginAsUser({
  //   required String name,
  //   required String phone,
  //   required String gender,
  //   required DateTime dob,
  //   // required String email,
  // }) async {
  //   return await AuthRepository.loginUser(
  //     // email: email,
  //     name: name,
  //     phone: phone,
  //     dob: dob,
  //     gender: gender
  //   );
  // }
}
