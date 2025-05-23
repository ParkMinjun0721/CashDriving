import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String logoImageUrl =
      "https://firebasestorage.googleapis.com/v0/b/party-bread.firebasestorage.app/o/1111.jpg?alt=media&token=96e301dd-ebb6-40ca-9456-2f0e0d03dd78";

  Future<void> _signInWithGoogle() async {
    try {
      // 로그아웃 후 새 계정 선택하도록 설정
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      await _handleUserSignIn(userCredential.user, isGoogleSignIn: true);
    } catch (e) {
      print("Error Google sign-in: $e");
    }
  }

  Future<void> _handleUserSignIn(User? user,
      {required bool isGoogleSignIn}) async {
    if (user == null) return;

    final userDoc = _firestore.collection('user').doc(user.uid);
    final userDocSnapshot = await userDoc.get();

    if (!userDocSnapshot.exists) {
      // 새로운 사용자 Firestore에 추가
      await userDoc.set({
        'name': isGoogleSignIn ? user.displayName : '사용자 이름',
        'email': user.email ?? '이메일 없음',
        'uid': user.uid,
        'interactedDocs': [],
      });
    } else {
      Navigator.pushReplacementNamed(context, '/home'); // 기존 사용자 홈 페이지로 이동 //이동
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBDEFB), // 배경 색상
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 이미지
            Image.network(
              logoImageUrl,
              height: 500, // 이미지 크기 조정
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.error,
                size: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 0),
            // 구글 로그인 버튼
            ElevatedButton.icon(
              onPressed: _signInWithGoogle,
              icon: Image.asset(
                'assets/image/Google_2015_logo.svg.png', // PNG 로고 경로
                height: 24,
                width: 24,
              ),
              label: Text('구글로 로그인', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF5E0D3),
                foregroundColor: Color(0xFF5B3A30),
                minimumSize: Size(300, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            //SizedBox(height: 16),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/sign_in_email'); //이동
            //   },
            //   icon: Icon(Icons.email, color: Color(0xFF5B3A30)),
            //   label: Text('이메일로 로그인', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color(0xFFF5E0D3),
            //     foregroundColor: Color(0xFF5B3A30),
            //     minimumSize: Size(300, 60),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            //SizedBox(height: 12),
            // 회원가입 버튼
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup'); //이동
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                  color: Color(0xFFF5E0D3), // 텍스트 색상
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
