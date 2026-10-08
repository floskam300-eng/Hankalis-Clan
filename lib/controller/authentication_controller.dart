// ignore: deprecated_member_use
import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/main.dart';

import 'package:hankalis_clan/services/auth_service.dart';
import 'package:toastification/toastification.dart';

enum InputType { name, email, password }

enum AuthenticationType { login, register }

class AuthenticationController extends GetxController {
  AuthenticationType _selectedIndex = AuthenticationType.login;
  bool _isVisible = true;

  get getIndex => _selectedIndex;
  get getIsVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    update();
  }

  set newIndex(AuthenticationType index) {
    _selectedIndex = index;
    update();
  }

  String? validInputs(String input, InputType type) {
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

  @override
  void onReady() {
    super.onReady();
    checkForToken();
  }

  void checkForToken() {
    final fullUrl = html.window.location.href;

    try {
      final uri = Uri.parse(fullUrl);

      if (uri.queryParameters.containsKey('token')) {
        final token = uri.queryParameters['token'];
        toastification.show(
          title: Text("Login successful!"),
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 5),
        );

        storage.setString("token", token!);
        Get.offAllNamed("/home", arguments: {"token": token});
      }
    } catch (e) {
      debugPrint("Error parsing URL: $e");
    }
  }

  Future<void> loginWithGoogle() async {
    const url = 'http://$DOMAIN/api/auth/login/google';
    html.window.location.href = url;
  }

  Future<void> loginWithFacebook() async {
    const url = 'http://$DOMAIN/api/auth/login/facebook';
    html.window.location.href = url;
  }

  Future<void> login({
    required (String email, String password) credentials,
  }) async {
    final response = await AuthService().login(
      credentials: {"email": credentials.$1, "password": credentials.$2},
    );

    if (response['message'] == null) {
      storage.setString("token", response['token']);
      toastification.show(
        title: Text("Login successful!"),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
      Get.toNamed("/home", arguments: {"token": response['token']});
    } else if (response['message'] ==
        "Please verify your email before logging in") {
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
      credentials: {
        "name": credentials.$1,
        "email": credentials.$2,
        "password": credentials.$3,
      },
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
