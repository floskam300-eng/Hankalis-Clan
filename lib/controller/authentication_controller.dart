import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:hankalis_clan/services/auth_service.dart';
import 'package:toastification/toastification.dart';

enum InputType { name, email, password }
enum AuthenticationType { login, register }

class LoginController extends GetxController {
  AuthenticationType _selectedIndex = AuthenticationType.login;

  get getIndex => _selectedIndex;

  set newIndex(AuthenticationType index) {
    _selectedIndex = index;
    update();
  }

  String? valideInputes(String input, InputType type) {
    if (type == InputType.name) {
      if (input.trim().isEmpty) {
        return "Name can't be empty.";
      }
    } else if (type == InputType.email) {
      if (input.trim().isEmpty) {
        return "Email can't be empty.";
      } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(input)) {
        return "Enter a valid email.";
      }
    } else if (type == InputType.password) {
      if (input.trim().isEmpty) {
        return "Email can't be empty.";
      } else if (!RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
      ).hasMatch(input)) {
        return "Enter a valid password.";
      }
    }
    return null;
  }

  Future<void> login({
    required (String email, String password) credentials,
  }) async {
    final response = await AuthService().login(
      credentials: {"email": credentials.$1, "password": credentials.$2},
    );

    debugPrint("token: ${response['token']}");

    if (response['message'] == null) {
      toastification.show(
        title: Text("Login successful!"),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    } else if (response['message'] == "Please verify your email before logging in") {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    } else {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }

  Future<void> register({
    required (String name, String email, String password) credentials,
  }) async {
    final response = await AuthService().register(
      credentials: {"name": credentials.$1, "email": credentials.$2, "password": credentials.$3},
    );

    if (response['message'] != "User already exists") {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    } else {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }
}
