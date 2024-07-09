import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

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

  static final googleApiKeyAndroid = dotenv.env['GOOGLE_API_KEY_ANDROID'] ?? '';
  static final googleApiKeyIos = dotenv.env['GOOGLE_API_KEY_IOS'] ?? '';
  static final googleAppIdAndroid = dotenv.env['GOOGLE_APP_ID_ANDROID'] ??
      '1:590504378458:android:64ccb90307f5c8c0a95863';
  static final googleAppIdIos = dotenv.env['GOOGLE_APP_ID_IOS'] ??
      '1:590504378458:ios:e9278ad2777de6f6a95863';
  static final googleSenderId =
      dotenv.env['GOOGLE_SENDER_ID'] ?? '590504378458';
  static final googleProjectId =
      dotenv.env['GOOGLE_PROJECT_ID'] ?? 'senabuwana';
  static final googleDatabaseUrl =
      dotenv.env['GOOGLE_DATABASE_URL'] ?? 'https://senabuwana.firebaseio.com';
  static final googleStorageBucket =
      dotenv.env['GOOGLE_STORAGE_BUCKET'] ?? 'senabuwana.appspot.com';

  static FirebaseOptions android = FirebaseOptions(
    apiKey: googleApiKeyAndroid,
    appId: googleAppIdAndroid,
    messagingSenderId: googleSenderId,
    projectId: googleProjectId,
    databaseURL: googleDatabaseUrl,
    storageBucket: googleStorageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: googleApiKeyIos,
    appId: googleAppIdIos,
    messagingSenderId: googleSenderId,
    projectId: googleProjectId,
    databaseURL: googleDatabaseUrl,
    storageBucket: googleStorageBucket,
    iosBundleId: 'com.example.flutterContacts',
  );
}
