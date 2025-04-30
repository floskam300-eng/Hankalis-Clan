import 'dart:convert';

import 'package:http/http.dart' as http;

class ForgotPasswordService {
  Future<Map> sendPasswordResetEmail(String email) async {
    final request = await http.post(
      Uri.parse("http://localhost:3000/api/auth/password/reset-password"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );

    return jsonDecode(request.body);
  }
}
