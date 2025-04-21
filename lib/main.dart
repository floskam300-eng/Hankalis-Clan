import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/binding/authentication_binding.dart';
import 'package:hankalis_clan/binding/games_binding.dart';
import 'package:hankalis_clan/binding/history_news_binding.dart';
import 'package:hankalis_clan/binding/history_slaves_binding.dart';
import 'package:hankalis_clan/binding/homepage_binding.dart';
import 'package:hankalis_clan/binding/leaderboard_binding.dart';
import 'package:hankalis_clan/binding/news_activity_binding.dart';
import 'package:hankalis_clan/binding/sell_slave_binding.dart';
import 'package:hankalis_clan/binding/side_bar_binding.dart';
import 'package:hankalis_clan/binding/view_image_binding.dart';
import 'package:hankalis_clan/themes/dark_theme.dart';
import 'package:hankalis_clan/views/forgot_password.dart';
import 'package:hankalis_clan/views/authentication.dart';
import 'package:hankalis_clan/views/homepage.dart';
import 'package:toastification/toastification.dart';

void main() {
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
          ),
          GetPage(
            name: '/auth/forgot-password',
            page: () => const ForgotPassword(),
          ),
          GetPage(name: '/', page: () => const Homepage(), bindings: [
            HomepageBinding(),
            SideBarBinding(),
            LeaderboardBinding(),
            NewsActivityBinding(),
            GamesBinding(),
            SellSlaveBinding(),
            HistorySlavesBinding(),
            ViewImageBinding(),
            HistoryNewsBinding()
          ]),
        ],
      ),
    );
  }
}
