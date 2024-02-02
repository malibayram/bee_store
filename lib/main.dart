import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'harun_odev_2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseFirestoreWeb();

  try {
    await Firebase.initializeApp(
      name: 'beestore-app',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    print(error);
  }

  runApp(const HarunOdev2());
}
