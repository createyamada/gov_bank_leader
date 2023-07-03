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
    apiKey: 'AIzaSyA2wfmTcm4G1I88z82pbPJxngv1Y5H3Ppk',
    appId: '1:620053387148:web:0ae38e13d9310d763b68a9',
    messagingSenderId: '620053387148',
    projectId: 'govbankleader',
    authDomain: 'govbankleader.firebaseapp.com',
    storageBucket: 'govbankleader.appspot.com',
    measurementId: 'G-2PJNGLL0HP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwIKia6fDTHMU6Gguko-iFxfH6glZuwPM',
    appId: '1:620053387148:android:b8b0e59136de07853b68a9',
    messagingSenderId: '620053387148',
    projectId: 'govbankleader',
    storageBucket: 'govbankleader.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZwwAN6hmq1L7f3ijLUmHI5cSRbeHHA-c',
    appId: '1:620053387148:ios:5d44b0d4221a6d753b68a9',
    messagingSenderId: '620053387148',
    projectId: 'govbankleader',
    storageBucket: 'govbankleader.appspot.com',
    iosClientId: '620053387148-f0evpvai2k6oh0apnlcqc8dv1ulk457e.apps.googleusercontent.com',
    iosBundleId: 'com.example.govBankLeader',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZwwAN6hmq1L7f3ijLUmHI5cSRbeHHA-c',
    appId: '1:620053387148:ios:9f5674418fcdd7643b68a9',
    messagingSenderId: '620053387148',
    projectId: 'govbankleader',
    storageBucket: 'govbankleader.appspot.com',
    iosClientId: '620053387148-6jgnl3pvs0bm827k66bj8cuju9qu07v1.apps.googleusercontent.com',
    iosBundleId: 'com.example.govBankLeader.RunnerTests',
  );
}