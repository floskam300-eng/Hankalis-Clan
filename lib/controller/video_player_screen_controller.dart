import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/animations_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenController extends GetxController {
  final animationsController = Get.find<AnimationsController>();

  late VideoPlayerController videoPlayerController;
  late OverlayPortalController overlayPortalController;
  final GlobalKey volumePosKey = GlobalKey();
  @override
  void onInit() async {
    super.onInit();
    await initServices();
  }

  Future<void> initServices() async {
    overlayPortalController = OverlayPortalController();
    await initVideoPlayer();
  }

  Future<void> initVideoPlayer() async {
    videoPlayerController = VideoPlayerController.asset(Get.arguments['path']!)
      ..addListener(update);
    await videoPlayerController.setLooping(false);
    await videoPlayerController.setVolume(1);
    await videoPlayerController.initialize();
    await videoPlayerController.play();
    update();
  }

  void seek(double value) =>
      videoPlayerController.seekTo(Duration(milliseconds: value.toInt()));

  Future<void> play() async {
    if (videoPlayerController.value.isPlaying) {
      await videoPlayerController.pause();
      animationsController.isPLayed = false;
    } else {
      await videoPlayerController.play();
      animationsController.isPLayed = true;
    }
    update();
  }

  void volume(double value) {
    videoPlayerController.setVolume(value / 100);
    update();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    animationsController.isPLayed = true;
    super.onClose();
  }
}
