import 'package:flutter/material.dart';

import 'dosya.dart';

// Fonksiyon tanımlamak
void main() {
  // Fonksiyon çağırmak
  print("ilk işlem başarılı olarak çalıştırıldı.");
  islem(selamlamaMetni, sayi);

  String name = "Serbay";

  bool isDebug = false;

  Widget myApp = MaterialApp(
    debugShowCheckedModeBanner: isDebug,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Image.asset(
              'varliklar/notification.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'varliklar/bag.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Hello, $name! How are you?',
        ),
      ),
      drawer: const Drawer(),
    ),
  );

  runApp(myApp);
}

// Veri tipleri
// Değişken tanımlamak
String selamlamaMetni = 'Merhaba Arkadaşlar!';

int sayi = 5;

String isim = "Serbay";
String soyisim = "Özkan";

int yas = 22;

double kilo = 70;

bool askerlikYaptiMi = false;

List<int> okullaGecenYillar = [2013, 2014, 2015, 2016, 2017, 2018, 2019];

Insan serbay = Insan("Serbay", "Özkan", 22, 70, false,
    [2013, 2014, 2015, 2016, 2017, 2018, 2019]);

Ogrenci tuncay = Ogrenci(
  "Tuncay",
  "Özkan",
  22,
  70,
  false,
  [2013, 2014, 2015, 2016, 2017, 2018, 2019],
  "123456",
  "İstanbul Teknik Üniversitesi",
);

class Insan {
  String isim;
  String soyisim;

  int yas;

  double kilo;

  bool askerlikYaptiMi;

  List<int> okullaGecenYillar;

  // Oluşturucu fonksiyon (constructor)
  Insan(this.isim, this.soyisim, this.yas, this.kilo, this.askerlikYaptiMi,
      this.okullaGecenYillar) {
    print("İnsan sınıfı oluşturuldu.");
  }
}

class Ogrenci extends Insan {
  String okulNumara;
  String okulIsmi;

  Ogrenci(
    super.isim,
    super.soyisim,
    super.yas,
    super.kilo,
    super.askerlikYaptiMi,
    super.okullaGecenYillar,
    this.okulNumara,
    this.okulIsmi,
  ) {
    print("Öğrenci sınıfı oluşturuldu.");
  }
}
