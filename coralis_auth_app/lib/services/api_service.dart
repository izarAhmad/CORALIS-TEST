import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://10.0.2.2:3000/api/auth";

  static Future register(String email, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return jsonDecode(res.body);
  }

  static Future login(String email, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return jsonDecode(res.body);
  }

  static Future forgotPassword(String email) async {
    final res = await http.post(
      Uri.parse('$baseUrl/forgot-password'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );
    return jsonDecode(res.body);
  }

  static Future resetPassword(String token, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/reset-password'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "token": token,
        "newPassword": password,
      }),
    );
    return jsonDecode(res.body);
  }
}
