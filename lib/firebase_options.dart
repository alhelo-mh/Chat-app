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
    apiKey: 'AIzaSyCLwyn0iLKnPpyW98yYeAtHDz6c4rWaIqE',
    appId: '1:355458876578:web:2663dcda759dc766e183fb',
    messagingSenderId: '355458876578',
    projectId: 'chatapp-f9133',
    authDomain: 'chatapp-f9133.firebaseapp.com',
    storageBucket: 'chatapp-f9133.appspot.com',
    measurementId: 'G-2C0C9VCMCG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyTmlDksUam8HdR641aZ38CqHUl0QzPDE',
    appId: '1:355458876578:android:9dfe4b7ed478cc9be183fb',
    messagingSenderId: '355458876578',
    projectId: 'chatapp-f9133',
    storageBucket: 'chatapp-f9133.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSkO10PGMmGF5YyrZ7jzQJPg2jbu1lTKQ',
    appId: '1:355458876578:ios:1bc39af21f446f91e183fb',
    messagingSenderId: '355458876578',
    projectId: 'chatapp-f9133',
    storageBucket: 'chatapp-f9133.appspot.com',
    iosClientId: '355458876578-ed4vvmph13j18laorevgaphq6tu89afn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSkO10PGMmGF5YyrZ7jzQJPg2jbu1lTKQ',
    appId: '1:355458876578:ios:1bc39af21f446f91e183fb',
    messagingSenderId: '355458876578',
    projectId: 'chatapp-f9133',
    storageBucket: 'chatapp-f9133.appspot.com',
    iosClientId: '355458876578-ed4vvmph13j18laorevgaphq6tu89afn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}