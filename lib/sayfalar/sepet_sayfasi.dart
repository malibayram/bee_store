import 'package:bee_store/cubitler/sepet_cubit.dart';
import 'package:bee_store/modeller/urun_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetSayfasi extends StatelessWidget {
  const SepetSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim")),
      body: BlocBuilder<SepetCubit, List<String>>(
        builder: (_, state) {
          return Column(
            children: [
              for (final urunID in state)
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('products')
                      .doc(urunID)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final urun = UrunModel.fromFirestore(
                        snapshot.data!.data()!,
                        snapshot.data!.id,
                      );
                      return Card(
                        child: ListTile(
                          title: Text(urun.baslik),
                          subtitle: Text(urun.fiyatUSD.toString()),
                        ),
                      );
                    }
                    return const LinearProgressIndicator();
                  },
                )
            ],
          );
        },
      ),
    );
  }
}
