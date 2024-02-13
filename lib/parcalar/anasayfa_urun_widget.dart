import 'package:bee_store/modeller/urun_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnasayfaUrunWidget extends StatefulWidget {
  const AnasayfaUrunWidget({super.key, required this.urun});

  final UrunModel urun;

  @override
  State createState() => _AnasayfaUrunWidgetState();
}

class _AnasayfaUrunWidgetState extends State<AnasayfaUrunWidget> {
  bool _favorideMi = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    return Card(
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.urun.resimAdresi,
                  width: 180,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        _favorideMi = !_favorideMi;
                        setState(() {});
                      },
                      icon: _favorideMi
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: StreamBuilder(
                      stream: userDoc.snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          final List cartArray = snapshot.data!['cart'] ?? [];
                          final inCart = cartArray.contains(widget.urun.uid);

                          return IconButton(
                            onPressed: () {
                              if (inCart) {
                                userDoc.update({
                                  'cart':
                                      FieldValue.arrayRemove([widget.urun.uid])
                                });
                              } else {
                                userDoc.update({
                                  'cart':
                                      FieldValue.arrayUnion([widget.urun.uid])
                                });
                              }
                            },
                            icon: inCart
                                ? const Icon(Icons.shopping_bag)
                                : const Icon(Icons.shopping_bag_outlined),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.urun.baslik,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "\$${widget.urun.fiyatUSD - (widget.urun.fiyatUSD * widget.urun.indirimOrani)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Text(
                  "\$${widget.urun.fiyatUSD}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 12),
                Text("${(widget.urun.indirimOrani * 100).toInt()}% OFF"),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
