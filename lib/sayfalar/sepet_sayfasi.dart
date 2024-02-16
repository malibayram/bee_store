import 'dart:math';

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
          if (state.isEmpty) {
            return const Center(child: Text("Sepetiniz boş"));
          }

          final toplamSepetTutariNotifier = ValueNotifier(0.0);

          return Column(
            children: [
              Expanded(
                child: ListView(
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

                            final indirimliFiyat = urun.fiyatUSD -
                                urun.fiyatUSD * urun.indirimOrani;

                            Future.delayed(Duration(
                                    milliseconds: Random().nextInt(150)))
                                .whenComplete(() => toplamSepetTutariNotifier
                                    .value += indirimliFiyat);

                            return Card(
                              child: ListTile(
                                title: Text(urun.baslik),
                                subtitle: Row(
                                  children: [
                                    Text("\$${urun.fiyatUSD}"),
                                    const VerticalDivider(),
                                    Text(
                                      "İndirimli fiyat: \$${indirimliFiyat.toStringAsFixed(2)}",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const LinearProgressIndicator();
                        },
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Toplam sepet tutarı: "),
                            ValueListenableBuilder(
                              valueListenable: toplamSepetTutariNotifier,
                              builder: (_, tutar, __) {
                                return Text(
                                  "\$${tutar.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.blue,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Ödemeye Geç",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
