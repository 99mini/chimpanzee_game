// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCFRVYxlW8ke7lKUm--VpINY7lFIRduTZ8',
    appId: '1:943526524659:web:6fc3e379196f5d9b85a986',
    messagingSenderId: '943526524659',
    projectId: 'chimpanzee-game',
    authDomain: 'chimpanzee-game.firebaseapp.com',
    storageBucket: 'chimpanzee-game.appspot.com',
    measurementId: 'G-NC1W17VZSV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM4xh34kOOBB8F11oI9BGS2Dc8Iy569H8',
    appId: '1:943526524659:android:e215c132e0ca40a785a986',
    messagingSenderId: '943526524659',
    projectId: 'chimpanzee-game',
    storageBucket: 'chimpanzee-game.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkjKOEPATb_SQxXlK_xn_A3haZS3AaM9U',
    appId: '1:943526524659:ios:2857aa9d7b60a0d885a986',
    messagingSenderId: '943526524659',
    projectId: 'chimpanzee-game',
    storageBucket: 'chimpanzee-game.appspot.com',
    iosClientId: '943526524659-kohphnkqs2h4qphchnt52hg6813a62kv.apps.googleusercontent.com',
    iosBundleId: 'c',
  );
}
