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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAVOgLhVvdERfYxnsEAifEupoWSTg61nKg',
    appId: '1:1012396149299:web:9518119e358e734cb77146',
    messagingSenderId: '1012396149299',
    projectId: 'tales-a39aa',
    authDomain: 'tales-a39aa.firebaseapp.com',
    storageBucket: 'tales-a39aa.appspot.com',
    measurementId: 'G-4VDXDK9P4B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7DvWvLADGS9GL4WxpqXuvg6lZorjuexM',
    appId: '1:1012396149299:android:a8c6e6d91b96dd11b77146',
    messagingSenderId: '1012396149299',
    projectId: 'tales-a39aa',
    storageBucket: 'tales-a39aa.appspot.com',
  );
}
