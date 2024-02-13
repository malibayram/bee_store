import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetCubit extends Cubit<List<String>> {
  SepetCubit(String userUID) : super([]) {
    sepetDoc = FirebaseFirestore.instance.collection('users').doc(userUID);

    sepetDoc.snapshots().listen((event) {
      List cartArray = event.data()?['cart'] ?? [];
      emit([...cartArray]);
    });
  }

  late DocumentReference<Map<String, dynamic>> sepetDoc;

  void sepeteUrunEkleCikar(String urunID) {
    sepetDoc.update({
      'cart': state.contains(urunID)
          ? FieldValue.arrayRemove([urunID])
          : FieldValue.arrayUnion([urunID])
    });
  }
}
