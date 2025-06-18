import 'dart:convert';

import 'package:hankalis_clan/const.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map> login({required Map<String, String> credentials}) async {
    final request = await http.post(
      Uri.parse("http://$DOMAIN/api/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": credentials["email"],
        "password": credentials["password"],
      }),
    );

    return jsonDecode(request.body);
  }

  Future<Map> register({required Map<String, String> credentials}) async {
    final request = await http.post(
      Uri.parse("http://192.168.1.4:3000/api/auth/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "name": credentials["name"],
        "email": credentials["email"],
        "password": credentials["password"],
      }),
    );

    return jsonDecode(request.body);
  }
}
