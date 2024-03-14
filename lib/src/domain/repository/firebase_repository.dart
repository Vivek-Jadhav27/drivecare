import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivecare/src/utils/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseRepository {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> addUser(
      String userId, String username, String email, String password,String phone  ) async {
    await db.collection('users').doc(userId).set({
      'username': username,
      'email': email,
      'password': password,
      'phone': phone
    });
  }

   static Future<void> addAdmin(
      String userId, String garagename, String email,String phone ,String password) async {
    await db.collection('admins').doc(userId).set({
      'garagename': garagename,
      'email': email,
      'password': password,
      'phone': phone
    });
  }
  static Future<void> signupUser(
      String name, String email, String password,String phone, BuildContext context) async {
    try {
      showLoadingIndicator(context);
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign Up Successful.'),
      ));
      User? user = auth.currentUser;
      if (user != null) {
        String userId = user.uid;
        await addUser(userId, name, email, password , phone);
        hideLoadingIndicator(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User Added Successful.'),
        ));
      }

      //  Navigator.pushNamed(context, route.questinnaire);
    } catch (e) {
      print('Login failed: $e');
      String error = e.toString();
      hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(' error :$error'),
      ));
    }
  }

  static Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      showLoadingIndicator(context);

      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successful.'),
      ));
      Navigator.pushNamed(context, Routes.customermainpage);
    } catch (e) {
      print('Login failed: $e');

      hideLoadingIndicator(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('error : ${e}'),
      ));
    }
  }

   static Future<void> signupAdmin(
      String name, String email, String password, String phone,BuildContext context) async {
    try {
      showLoadingIndicator(context);
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign Up Successful.'),
      ));
      User? user = auth.currentUser;

      if (user != null) {
        String userId = user.uid;
        await addAdmin(userId, name, email,phone ,password);
        hideLoadingIndicator(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Garage Added Successful.'),
        ));
      }

       Navigator.pushNamed(context, Routes.customermainpage);
    } catch (e) {
      print('Login failed: $e');
      String error = e.toString();
      hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(' error :$error'),
      ));
    }
  }

  static Future<void> loginAdmin(
      String email, String password, BuildContext context) async {
    try {
      showLoadingIndicator(context);

      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successful.'),
      ));
      Navigator.pushNamed(context, Routes.customermainpage);
    } catch (e) {
      print('Login failed: $e');

      hideLoadingIndicator(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('error : ${e}'),
      ));
    }
  }

  static void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void hideLoadingIndicator(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
