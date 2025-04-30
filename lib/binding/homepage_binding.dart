import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/firends_side_bar_controller.dart';
import 'package:hankalis_clan/controller/games_controller.dart';
import 'package:hankalis_clan/controller/history_news_controller.dart';
import 'package:hankalis_clan/controller/history_slaves_controller.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/controller/leaderboard_controller.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/controller/sell_slave_controller.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/controller/view_imag_cotroller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageController(), fenix: true);
    Get.lazyPut(() => SideBarController(), fenix: true);
    Get.lazyPut(() => FirendsSideBarController(), fenix: true);
    Get.lazyPut(() => LeaderboardController(), fenix: true);
    Get.lazyPut(() => NewsActivityController(), fenix: true);
    Get.lazyPut(() => GamesController(), fenix: true);
    Get.lazyPut(() => SellSlaveController(), fenix: true);
    Get.lazyPut(() => HistorySlavesController(), fenix: true);
    Get.lazyPut(() => ViewImagCotroller(), fenix: true);
    Get.lazyPut(() => HistoryNewsController(), fenix: true);
    Get.lazyPut(() => ChatsController(), fenix: true);
  }
}
