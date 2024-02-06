import 'package:flutter/material.dart';

class AnasayfaUrunWidget extends StatefulWidget {
  const AnasayfaUrunWidget({
    super.key,
    required this.baslik,
    required this.resimAdresi,
    required this.usdFiyat,
    required this.indirimOrani,
  });

  final String baslik;
  final String resimAdresi;
  final double usdFiyat;
  final double indirimOrani;

  @override
  State createState() => _AnasayfaUrunWidgetState();

  /* 
  Üstteki fonksiyonun uzun versiyonu
  State createState() {
    return _AnasayfaUrunWidgetState();
  }
   */
}

/* String baslik = "Adidas wihite sneakers for men";
String resimAdresi = "varliklar/resimler/Adidas1.png";

double usdFiyat = 68.5;
double indirimOrani = 50; */

bool favorideMi = false;

/*
var
final
const
*/

// access modifier
class _AnasayfaUrunWidgetState extends State<AnasayfaUrunWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                widget.resimAdresi,
                height: 180,
              ),
              const Positioned.fill(
                child: Center(
                  child: Icon(Icons.favorite),
                ),
              ),
            ],
          ),
          Text(widget.baslik),
          Row(
            children: [
              Text(
                "\$${widget.usdFiyat}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                "\$136",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text("${widget.indirimOrani}% OFF"),
            ],
          )
        ],
      ),
    );
  }
}
