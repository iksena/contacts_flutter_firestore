# contacts_flutter_firestore

Simple Contacts App with Flutter and Firebase Cloud Firestore

## Getting Started

You will need to create a Google Firebase account and create a Cloud FireStore database to be used in this app. Follow [this documentation](https://firebase.google.com/docs/firestore) to do it.

## Using this project

To use this project, follow these steps:

1. Create .env file in the root project folder and put Google API Key and App ID like below:
```
GOOGLE_API_KEY_ANDROID=
GOOGLE_API_KEY_IOS=
GOOGLE_APP_ID_ANDROID=
GOOGLE_APP_ID_IOS=
GOOGLE_SENDER_ID=
GOOGLE_PROJECT_ID=senabuwana
GOOGLE_DATABASE_URL=https://senabuwana.firebaseio.com
GOOGLE_STORAGE_BUCKET=senabuwana.appspot.com
```
2. Install Flutter SDK for Android and iOS development by following [this tutorial](https://docs.flutter.dev/get-started/install)

3. In your terminal, run `flutter run` to start the project in your device or emulator

4. To try directly this project without setting up, download app-release.apk in this repository and install on you Android device
