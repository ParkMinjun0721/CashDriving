import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getUserDoc(String uid) {
    return _firestore.collection('user').doc(uid).get();
  }

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
  }) async {
    await _firestore.collection('user').doc(uid).set({
      'name': name,
      'email': email,
      'uid': uid,
      'interactedDocs': [],
    });
  }
}
