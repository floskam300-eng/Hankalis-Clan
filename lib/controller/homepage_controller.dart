// ignore_for_file: deprecated_member_use
import 'dart:html' as html;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/main.dart';
import 'package:hankalis_clan/services/notification_token.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:toastification/toastification.dart';

class HomepageController extends GetxController {
  late Map user;
  late io.Socket socket;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() async {
    super.onInit();
    getUser();
    connectToServer();
    await initNotifications();
  }

  void getUser() {
    final String token;
    if (Get.arguments != null) {
      token = Get.arguments['token'];
    } else {
      token = storage.getString("token")!;
    }

    user = decodeToken(token)!;
    debugPrint("User: $user");
  }

  void connectToServer() {
    const serverUrl = 'http://$DOMAIN';
    socket = io.io(
      serverUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setQuery({'token': storage.getString("token")!})
          .build(),
    );

    socket.connect().onConnect((_) => debugPrint('Connected to server...'));
    socket.onError((error) => debugPrint('Socket error: $error'));

    socket.on("invalid_credentials", (_) {
      storage.remove("token");
      html.window.location.href = '/';
    });

    socket.on(
      'error',
      (error) => toastification.show(
        title: Text(error.toString()),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
      ),
    );

    socket.onDisconnect((_) => debugPrint('Disconnected from server...'));
  }

  Future<void> initNotifications() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
      await getToken();
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
      await getToken();
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  Future<void> getToken() async {
    if (kIsWeb) {
      String? token = await _firebaseMessaging.getToken(
        vapidKey:
            "BL4A2yjV7qVLSb0PeYR6gVRDN33OgmaRZIkOZFXFin7Px4-Cp_5ZoiNcPoJbc4sS5jXeGIF-Evrz2EbcMnKiBcU",
      );

      if (token != null) {
        debugPrint("FCM Token: $token");
        final response = await NotificationToken().sendToken(user['id'], token);
        debugPrint("Response: ${response['message']}");
      }
    }
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
    storage.remove("token");
    html.window.location.href = '/';
    return null;
  }
}
