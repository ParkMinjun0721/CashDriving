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
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                logoImageUrl,
                height: 180,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _handleLogin,
                icon: Image.asset(
                  'assets/images/Google_2015_logo.svg.png',
                  width: 24,
                  height: 24,
                ),
                label: const Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'CashDriving에 오신 것을 환영합니다!',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
