// 요약: Google Sign-In과 Firebase Auth 연동을 캡슐화합니다.
// - 매 로그인 시 계정 선택을 강제합니다.
// - Google 인증 토큰으로 Firebase 인증을 수행합니다.
// - 로그아웃 기능도 함께 제공합니다.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut(); // 항상 새 계정 선택

      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Google login failed: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
