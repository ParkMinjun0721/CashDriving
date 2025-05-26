import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/purchased_product.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getUserDoc(String uid) {
    return _firestore.collection('user').doc(uid).get();
  }

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
    required int point,
    required List<PurchasedProduct> product, // ✅ 명확한 타입 선언
  }) async {
    await _firestore.collection('user').doc(uid).set({
      'name': name,
      'email': email,
      'uid': uid,
      'interactedDocs': [],
      'point': point,
      'product': product.map((p) => p.toMap()).toList(), // ✅ toMap()으로 변환
    });
  }
}
