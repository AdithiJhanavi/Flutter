import 'package:flutter/material.dart';

void main() {
  runApp(DemoApp(apiService: ApiService()));
}

class DemoApp extends StatelessWidget {
  final ApiService apiService;

  const DemoApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Learning App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(apiService: apiService),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ApiService apiService;

  const HomeScreen({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: const Center(
        child: Text('Please log in to continue.'),
      ),
    );
  }
}

class ApiService {
  // Define your ApiService methods and properties here
}
