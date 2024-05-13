import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBmJOPi_ZFWQche2jhz1O83dUYulS34obk",
            authDomain: "gravity-4nci7k.firebaseapp.com",
            projectId: "gravity-4nci7k",
            storageBucket: "gravity-4nci7k.appspot.com",
            messagingSenderId: "663901949622",
            appId: "1:663901949622:web:6b18ab5d7c07dd8eaae017"));
  } else {
    await Firebase.initializeApp();
  }
}
