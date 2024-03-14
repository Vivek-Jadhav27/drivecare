// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNaVG4sU5BEihfvgc_bp51Mkh2A49p9kw',
    appId: '1:441495861898:web:678faef31aebb2ffed8b73',
    messagingSenderId: '441495861898',
    projectId: 'drivecare-b1f35',
    authDomain: 'drivecare-b1f35.firebaseapp.com',
    storageBucket: 'drivecare-b1f35.appspot.com',
    measurementId: 'G-G1TG7MWXJC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqsfxEQM6yS6hBwCF_qn6YbqmGhj1Lx90',
    appId: '1:441495861898:android:9f24ebd94ca25f60ed8b73',
    messagingSenderId: '441495861898',
    projectId: 'drivecare-b1f35',
    storageBucket: 'drivecare-b1f35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM1xM_5KE_pdy4j9L7RrVWnmJNfVaDdbs',
    appId: '1:441495861898:ios:dc080a3431f88976ed8b73',
    messagingSenderId: '441495861898',
    projectId: 'drivecare-b1f35',
    storageBucket: 'drivecare-b1f35.appspot.com',
    iosBundleId: 'com.example.drivecare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBM1xM_5KE_pdy4j9L7RrVWnmJNfVaDdbs',
    appId: '1:441495861898:ios:2a48a28de1717513ed8b73',
    messagingSenderId: '441495861898',
    projectId: 'drivecare-b1f35',
    storageBucket: 'drivecare-b1f35.appspot.com',
    iosBundleId: 'com.example.drivecare.RunnerTests',
  );
}