import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class ApiService {
  // Fetch the profile with token authentication
  static Future<Map<String, dynamic>?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final res = await http.get(
      Uri.parse('$apiBaseUrl/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return null;
    }
  }

  // Demo user login by setting a demo token
  static Future<void> loginAsDemoUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', demoToken);
  }

  // Logout by removing the token
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  // Replace the getAuthToken method to use demo data instead of making an API call
  static Future<String?> getAuthToken() async {
    // Simulate a successful login with a demo token
    const demoToken = "demo-token-1234";
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', demoToken);
    return demoToken;
  }

  // Fetch course content with token authentication
  static Future<List<Map<String, dynamic>>> getCourseContent() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      return [
        {"type": "demo", "content": "This is demo content."}
      ];
    } else {
      throw Exception('No token found. Unable to fetch course content.');
    }
  }

  // Add a method to call the createCourseContent endpoint
  Future<List<Map<String, dynamic>>> createCourseContent(String className) async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl/createCourseContent'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"className": className}),
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch course content');
    }
  }
}
