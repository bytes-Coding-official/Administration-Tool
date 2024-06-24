import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6LdoJgAqAAAAAD3pZss5zW8wuzaTx_hzMbUcKhdl'),
      androidProvider: AndroidProvider.playIntegrity,
    );
