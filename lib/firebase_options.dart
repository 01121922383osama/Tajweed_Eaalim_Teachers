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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdxi90xQOiOvWlYWXDujtPjiJRxxcfRSk',
    appId: '1:177941012432:android:3d71e27fe0717cdfe223d5',
    messagingSenderId: '177941012432',
    projectId: 'eaalim-tajweed-13602',
    storageBucket: 'eaalim-tajweed-13602.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhpM23QMdp2UXUf39avalYi4GJmwvcJMs',
    appId: '1:177941012432:ios:a712e2f63d4935fce223d5',
    messagingSenderId: '177941012432',
    projectId: 'eaalim-tajweed-13602',
    storageBucket: 'eaalim-tajweed-13602.appspot.com',
    iosBundleId: 'com.example.eaalimTajweed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhpM23QMdp2UXUf39avalYi4GJmwvcJMs',
    appId: '1:177941012432:ios:350f770de28bb6c5e223d5',
    messagingSenderId: '177941012432',
    projectId: 'eaalim-tajweed-13602',
    storageBucket: 'eaalim-tajweed-13602.appspot.com',
    iosBundleId: 'com.example.eaalimTajweed.RunnerTests',
  );
}
