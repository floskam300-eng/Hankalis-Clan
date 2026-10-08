import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hankalis_clan/binding/authentication_binding.dart';
import 'package:hankalis_clan/binding/forgot_password_binding.dart';
import 'package:hankalis_clan/binding/homepage_binding.dart';
import 'package:hankalis_clan/binding/video_player_screen_binding.dart';
import 'package:hankalis_clan/middlewares/auth_middleware.dart';
import 'package:hankalis_clan/themes/dark_theme.dart';
import 'package:hankalis_clan/views/forgot_password.dart';
import 'package:hankalis_clan/views/authentication.dart';
import 'package:hankalis_clan/views/homepage.dart';
import 'package:hankalis_clan/views/video_player_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'package:url_strategy/url_strategy.dart';

  late SharedPreferences storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storage = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCde0F3bF4Eb7aXsz4zquNNHaUTOuXoGJ4",
      authDomain: "hankalis-clan-851df.firebaseapp.com",
      projectId: "hankalis-clan-851df",
      storageBucket: "hankalis-clan-851df.firebaseapp.com",
      messagingSenderId: "103364723036",
      appId: "1:103364723036:web:e7b98fbbf5724c0c900199",
      measurementId: "G-7PNW7SYLPV",
    ),
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: "Hankalis Clan",
        debugShowCheckedModeBanner: false,
        theme: DarkTheme().dark,
        initialRoute: '/auth',
        getPages: [
          GetPage(
            name: '/auth',
            page: () => const Authentication(),
            binding: AuthenticationBinding(),
            middlewares: [AuthMiddleware()],
          ),
          GetPage(
            name: '/auth/forgot-password',
            page: () => const ForgotPassword(),
            binding: ForgotPasswordBinding(),
          ),
          GetPage(
            name: '/home',
            page: () => const Homepage(),
            binding: HomepageBinding(),
          ),
          GetPage(
            name: '/home/video',
            page: () => VideoPlayerScreen(),
            binding: VideoPlayerScreenBinding(),
          ),
        ],
      ),
    );
  }
}
