import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/services/services.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = Services.storage.getString("token");
    if (token != null) {
      return RouteSettings(name: "/home", arguments: {"token": token});
    }
    return null;
  }
}
