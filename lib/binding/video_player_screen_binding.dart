import 'package:get/get.dart';
import 'package:hankalis_clan/controller/video_player_screen_controller.dart';

class VideoPlayerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoPlayerScreenController(), fenix: true);
  }
}