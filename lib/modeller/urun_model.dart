class UrunModel {
  final String uid;
  final String baslik;
  final String resimAdresi;
  final int fiyatUSD;
  final double indirimOrani;

  const UrunModel({
    required this.uid,
    required this.baslik,
    required this.resimAdresi,
    required this.fiyatUSD,
    required this.indirimOrani,
  });

  factory UrunModel.fromFirestore(Map map, String uid) {
    return UrunModel(
      uid: uid,
      baslik: map['title'],
      resimAdresi: map['imageURL'],
      fiyatUSD: map['priceUSD'],
      indirimOrani: map['discountRatio'],
    );
  }
}
