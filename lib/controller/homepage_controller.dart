// ignore_for_file: deprecated_member_use
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:hankalis_clan/services/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class HomepageController extends GetxController {
  late Map user;
  late io.Socket socket;

  @override
  void onInit() async {
    super.onInit();
    getUser();
    connectToServer();
  }

  void getUser() {
    final String token;
    if (Get.arguments != null) {
      token = Get.arguments['token'];
    } else {
      token = Services.storage.getString("token")!;
    }

    user = decodeToken(token)!;
  }

  void connectToServer() {
    const serverUrl = 'http://localhost:3000';
    socket = io.io(
      serverUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setQuery({'userId': user['id']})
          .build(),
    );

    socket.connect().onConnect((_) {
      debugPrint('Connected to server...');
    });

    socket.onError((error) {
      debugPrint('Socket error: $error');
    });

    socket.on("invalid_credentials", (_) {
      Services.storage.remove("token");
      html.window.location.href = '/';
    });

    socket.on('error', (error) => debugPrint('Error: $error'));
    socket.onDisconnect((_) => debugPrint('Disconnected from server...'));
  }

  Map<String, dynamic>? decodeToken(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey('asdasd123'));
      return jwt.payload as Map<String, dynamic>;
    } on JWTExpiredException {
      debugPrint('jwt expired');
    } on JWTException catch (ex) {
      debugPrint(ex.message);
    }
    Services.storage.remove("token");
    html.window.location.href = '/';
    return null;
  }
}
