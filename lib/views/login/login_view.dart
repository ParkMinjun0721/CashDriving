import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/auth_service.dart';
import '../auth/firebase_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthService _authService = AuthService();
  final FirebaseService _firebaseService = FirebaseService();

  final String logoImageUrl =
      "https://firebasestorage.googleapis.com/v0/b/cash-driving.firebasestorage.app/o/applogo.png?alt=media&token=b5fac182-01e9-4e1e-b65c-92800000772a";

  Future<void> _handleLogin() async {
    try {
      final user = await _authService.signInWithGoogle();
      if (user == null) return;

      final doc = await _firebaseService.getUserDoc(user.uid);
      if (!doc.exists) {
        await _firebaseService.createUser(
          uid: user.uid,
          name: user.displayName ?? 'Unknown',
          email: user.email ?? 'No Email',
        );
      }

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인 실패: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 상단 곡선 배경
          ClipPath(
            clipper: _TopWaveClipper(),
            child: Container(
              height: size.height * 0.35,
              color: Colors.blue[400],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 로고
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        logoImageUrl,
                        fit: BoxFit.cover, // 여기 핵심!
                        width: 160,
                        height: 160,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                      ),
                    ),
                  ),


                  const SizedBox(height: 24),
                  const SizedBox(height: 8),
                  const Text(
                    'Enjoy Your',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  // 타이틀
                  Text(
                    'CashDriving',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // 구글 로그인 버튼
                  ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sign in with ', style: TextStyle(fontSize: 16)),
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white, // 흰 배경
                            borderRadius: BorderRadius.circular(70),
                          ),
                          padding: const EdgeInsets.all(2), // 내부 여백
                          child: Image.asset(
                            'assets/images/Google_2015_logo.svg.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 곡선 배경용 클리퍼
class _TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
