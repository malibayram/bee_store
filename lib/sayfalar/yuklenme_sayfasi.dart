import 'package:bee_store/cubitler/sepet_cubit.dart';
import 'package:bee_store/sayfalar/giris_sayfasi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'harun_odev_2.dart';

Stream<DocumentSnapshot<Map<String, dynamic>>>? cartStream;

class YuklenmeSayfai extends StatelessWidget {
  const YuklenmeSayfai({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snapshot) {
        final girisYapildi = snapshot.hasData && snapshot.data != null;

        if (girisYapildi) {
          cartStream = FirebaseFirestore.instance
              .collection('users')
              .doc(snapshot.data!.uid)
              .snapshots();
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: girisYapildi
              ? BlocProvider(
                  create: (_) => SepetCubit(),
                  child: const HarunOdev2(),
                )
              : const GirisSayfasi(),
        );
      },
    );
  }
}
