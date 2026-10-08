import 'dart:convert';

import 'package:hankalis_clan/const.dart';
import 'package:http/http.dart' as http;

class NotificationToken {
  Future<Map> sendToken(String id, String token) async {
    final request = await http.post(
      Uri.parse("http://$DOMAIN/api/notification/$id/$token"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id": id, "token": token}),
    );

    return jsonDecode(request.body);
  }
}
