import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = storage.getString("token");
    if (token != null) {
      return RouteSettings(name: "/home", arguments: {"token": token});
    }
    return null;
  }
}
