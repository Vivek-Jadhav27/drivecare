// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivecare/src/config/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utils/constants/strings.dart';

// import '../domain/providers/network_status_provider.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Strings.firebaseApiKey,
      appId: Strings.firebaseAppId,
      messagingSenderId: Strings.firebaseMessagingSenderId,
      projectId: Strings.firebaseProjectId,
      storageBucket: Strings.defaultStorageBucket,
    ),
  );

  final auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final User? user = auth.currentUser;

  if (user != null) {
    Global.isloggedin = true;
    String userId = user.uid;
    final userdata = await db.collection('users').doc(userId).get();
    Global.isuser = userdata.exists;
  }
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  // );

  //  final networkStatusService = NetworkStatusService();
}
