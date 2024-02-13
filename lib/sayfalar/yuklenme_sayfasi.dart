import 'package:bee_store/cubitler/sepet_cubit.dart';
import 'package:bee_store/sayfalar/giris_sayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anasayfa.dart';

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
          home: girisYapildi
              ? BlocProvider(
                  create: (_) => SepetCubit(snapshot.data!.uid),
                  child: const Anasayfa(),
                )
              : const GirisSayfasi(),
        );
      },
    );
  }
}
