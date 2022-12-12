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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAZ6pTQn7FU-mups2_ooU0ENOsw2LX0fWs',
    appId: '1:244800466083:web:af6ff032b467c13971e316',
    messagingSenderId: '244800466083',
    projectId: 'rtku-70f39',
    authDomain: 'rtku-70f39.firebaseapp.com',
    storageBucket: 'rtku-70f39.appspot.com',
    measurementId: 'G-DMNWY954TN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALH81CrLWndFYDvBO6VK1nOUO07F4GSbU',
    appId: '1:244800466083:android:e2377c86bdc54af571e316',
    messagingSenderId: '244800466083',
    projectId: 'rtku-70f39',
    storageBucket: 'rtku-70f39.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB86ucvA233cfymcUo4lCm4qeM3vEg4lqU',
    appId: '1:244800466083:ios:4c8251122a6b49b671e316',
    messagingSenderId: '244800466083',
    projectId: 'rtku-70f39',
    storageBucket: 'rtku-70f39.appspot.com',
    iosClientId: '244800466083-1pps52pf24q2ld7ovicvkhr851ibj7un.apps.googleusercontent.com',
    iosBundleId: 'com.id.rtku',
  );
}