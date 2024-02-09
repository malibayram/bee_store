import 'package:bee_store/sayfalar/giris_sayfasi.dart';
import 'package:bee_store/sayfalar/harun_odev_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YuklenmeSayfai extends StatelessWidget {
  const YuklenmeSayfai({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snapshot) {
        final girisYapildi = snapshot.hasData && snapshot.data != null;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: girisYapildi ? const HarunOdev2() : const GirisSayfasi(),
        );
      },
    );
  }
}
