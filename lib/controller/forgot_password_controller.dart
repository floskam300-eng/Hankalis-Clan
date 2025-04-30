import 'package:flutter/material.dart' show Text;
import 'package:get/get.dart';
import 'package:hankalis_clan/services/forgot_password_service.dart';
import 'package:toastification/toastification.dart';

enum InputType { name, email, password }

class ForgotPasswordController extends GetxController {
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

  sendPasswordResetEmail(String email) async {
    final response = await ForgotPasswordService().sendPasswordResetEmail(
      email,
    );

    if (response['message'] == "User not found") {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    } else if (response['message'] ==
        "Please verify your email before resetting your password") {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    } else if (response['message'] == "Password reset email sent") {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
      Get.back();
    } else if (response['message'] ==
        "Password reset is only available for registered users") {
      toastification.show(
        title: Text(response['message']),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
        }
  }
}
