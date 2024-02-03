import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'harun_odev_2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  pozitifSayiTopla(a: 12, b: 5);

  String baslik = "Merhaba Dünya";

  baslik = "Başka bir değer";

  // Null Pointer Exception

  // Null Safety

  print(baslik.length);

  runApp(const HarunOdev2());
}

int pozitifSayiTopla({int a = 0, int b = 0}) {
  if (a < 0 || b < 0) {
    throw Exception('a ve b pozitif olmalıdır. a: $a, b: $b');
  }

  return a + b;
}

class OrnekWidget {
  String baslik;
  String altBaslik;

  OrnekWidget(this.baslik, this.altBaslik);

  void yazdir() {
    print('Başlık: $baslik, Alt Başlık: $altBaslik');
  }
}
