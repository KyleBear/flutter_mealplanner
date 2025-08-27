import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDF2p0hF7nP3l8ZDg85jaN0vpfEOLOmRn4",
            authDomain: "meal-planner-g9dtkv.firebaseapp.com",
            projectId: "meal-planner-g9dtkv",
            storageBucket: "meal-planner-g9dtkv.appspot.com",
            messagingSenderId: "1073755732886",
            appId: "1:1073755732886:web:4b32adbe3ca80a7e4c7bb7"));
  } else {
    await Firebase.initializeApp();
  }
}
