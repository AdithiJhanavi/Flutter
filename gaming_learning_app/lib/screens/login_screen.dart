import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _handleLogin(BuildContext context) async {
    await ApiService.loginAsDemoUser();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(apiService: ApiService())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleLogin(context),
          child: const Text("Continue as Demo User"),
        ),
      ),
    );
  }
}
