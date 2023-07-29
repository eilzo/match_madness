import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCdji28MVzPgvdB_j8mVIuDTx9JWlI43KY",
            authDomain: "fflingo-2868f.firebaseapp.com",
            projectId: "fflingo-2868f",
            storageBucket: "fflingo-2868f.appspot.com",
            messagingSenderId: "507686025866",
            appId: "1:507686025866:web:9e4a2f57a480479bb0cb73",
            measurementId: "G-9RSDKR63MW"));
  } else {
    await Firebase.initializeApp();
  }
}
