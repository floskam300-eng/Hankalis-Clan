import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/binding/authentication_binding.dart';
import 'package:hankalis_clan/binding/forgot_password_binding.dart';
import 'package:hankalis_clan/binding/homepage_binding.dart';
import 'package:hankalis_clan/binding/video_player_screen_binding.dart';
import 'package:hankalis_clan/middlewares/auth_middleware.dart';
import 'package:hankalis_clan/services/services.dart';
import 'package:hankalis_clan/themes/dark_theme.dart';
import 'package:hankalis_clan/views/forgot_password.dart';
import 'package:hankalis_clan/views/authentication.dart';
import 'package:hankalis_clan/views/homepage.dart';
import 'package:hankalis_clan/views/video_player_screen.dart';
import 'package:toastification/toastification.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await mainAsync();
  setPathUrlStrategy();
  runApp(const MyApp());
}

Future<void> mainAsync() async {
  Get.putAsync(() async => Services());
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
