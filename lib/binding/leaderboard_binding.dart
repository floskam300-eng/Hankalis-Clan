import 'package:get/get.dart';
import 'package:hankalis_clan/controller/leaderboard_controller.dart';

class LeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaderboardController(), fenix: true);
  }
}