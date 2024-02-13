import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiAdapter {
  static const String baseUrl = 'https://your-django-api-url.com'; // Replace with your Django API URL

  static Future<bool> authenticate(String username, String password) async {
    final String loginUrl = '$baseUrl/api/token/'; // Replace with your Django token authentication endpoint

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Authentication successful
        return true;
      } else {
        // Authentication failed
        return false;
      }
    } catch (e) {
      // Handle exceptions (e.g., network issues)
      print('Error during authentication: $e');
      return false;
    }
  }
}