// 요약: Firestore 사용자 문서 생성/조회 서비스입니다.
// - 사용자 문서를 읽어 상태 초기화에 활용합니다.
// - 신규 사용자의 기본 필드를 생성합니다.
// - 구매 내역을 모델 형태로 직렬화해 저장합니다.
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
