import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDsKND57TaFtl5TLEcHUVC3SzDIkIcK22M",
            authDomain: "bytes-coding-admin-tool.firebaseapp.com",
            projectId: "bytes-coding-admin-tool",
            storageBucket: "bytes-coding-admin-tool.appspot.com",
            messagingSenderId: "321124574130",
            appId: "1:321124574130:web:6e185cb6aef034a6543aab",
            measurementId: "G-YXGHM15E58"));
  } else {
    await Firebase.initializeApp();
  }
}
