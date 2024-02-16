import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// API
// REST - API
// gRPC

// Http metotları
// GET - POST - DELETE - PATCH -

// JSON

class ApiDersSayfasi extends StatefulWidget {
  const ApiDersSayfasi({super.key});

  @override
  State<ApiDersSayfasi> createState() => _ApiDersSayfasiState();
}

class _ApiDersSayfasiState extends State<ApiDersSayfasi> {
  String _gelenCevap = "Gelecek Cevap";
  Soz? _gelenSoz;

  Future<String> _rastgeleSozGetir() async {
    final cevap = await http.get(Uri.parse("https://animechan.xyz/api/random"));

    if (cevap.statusCode == 200) {
      _gelenCevap = cevap.body;

      _gelenSoz = Soz.fromMap(jsonDecode(cevap.body));
    } else {
      _gelenCevap = "bir hata oluştu, internetten veri alınamadı";
    }

    setState(() {});

    return _gelenCevap;
  }

  @override
  void initState() {
    _rastgeleSozGetir();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_gelenSoz != null)
          Card(
            child: ListTile(
              title: Text(_gelenSoz!.soz),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Anime: ${_gelenSoz!.anime}"),
                  Text("Karakter: ${_gelenSoz!.karakter}"),
                ],
              ),
            ),
          ),
        Center(child: Text(_gelenCevap)),
      ],
    );
  }
}

class Soz {
  final int id;
  final String soz;
  final String karakter;
  final String anime;

  const Soz({
    required this.id,
    required this.soz,
    required this.karakter,
    required this.anime,
  });

  factory Soz.fromMap(Map map) {
    return Soz(
      id: map['id'],
      soz: map['quote'],
      karakter: map['character'],
      anime: map['anime'],
    );
  }
}
