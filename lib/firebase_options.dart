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
    apiKey: 'AIzaSyDSLYWqMnuMkhI1YInLDsbs6fU2j0GgFUA',
    appId: '1:455841410084:web:8d20f336d693264cc8bcb1',
    messagingSenderId: '455841410084',
    projectId: 'forthp-57786',
    authDomain: 'forthp-57786.firebaseapp.com',
    storageBucket: 'forthp-57786.appspot.com',
    measurementId: 'G-HTJEF0Q551',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBimfA4IZDs3oYqqE4u4rW-FRUFc3a3CYs',
    appId: '1:455841410084:android:3da8297139f9a5fac8bcb1',
    messagingSenderId: '455841410084',
    projectId: 'forthp-57786',
    storageBucket: 'forthp-57786.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKyj0cgaMh71qkvVmv8mO9Wb1zRJ7RFwc',
    appId: '1:455841410084:ios:350a534b40801230c8bcb1',
    messagingSenderId: '455841410084',
    projectId: 'forthp-57786',
    storageBucket: 'forthp-57786.appspot.com',
    iosBundleId: 'com.example.forthProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKyj0cgaMh71qkvVmv8mO9Wb1zRJ7RFwc',
    appId: '1:455841410084:ios:a9acc35573923b8ec8bcb1',
    messagingSenderId: '455841410084',
    projectId: 'forthp-57786',
    storageBucket: 'forthp-57786.appspot.com',
    iosBundleId: 'com.example.forthProject.RunnerTests',
  );
}
