import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/animations_controller.dart';
import 'package:hankalis_clan/controller/video_player_screen_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final videoPlayerScreenController = Get.find<VideoPlayerScreenController>();
    return Scaffold(
      backgroundColor: theme.onSecondary,
      body: SafeArea(
        child: GetBuilder<VideoPlayerScreenController>(
          builder: (controller) {
            final videoPlayerController = controller.videoPlayerController;
            if (videoPlayerController.value.isInitialized) {
              final position = videoPlayerController.value.position;
              final duration = videoPlayerController.value.duration;
              final width = controller.videoPlayerController.value.size.width;
              final height = controller.videoPlayerController.value.size.height;
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      behavior: HitTestBehavior.opaque,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 50),
                        width: width,
                        height: height,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: VideoPlayer(controller.videoPlayerController),
                        ),
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder:
                        (context, constraints) => Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Container(
                                height: 50,
                                width: Get.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(30, 33, 34, 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    GetBuilder<AnimationsController>(
                                      builder:
                                          (controller) => MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            onEnter: (event) {
                                              controller.isHovered = true;
                                              controller.hoveredIndex = 1;
                                            },
                                            onExit: (event) {
                                              controller.isHovered = false;
                                              controller.hoveredIndex = -1;
                                            },
                                            child: GestureDetector(
                                              onTap:
                                                  () =>
                                                      videoPlayerScreenController
                                                          .play(),
                                              child: Container(
                                                height: double.infinity,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color:
                                                      controller.isHovered &&
                                                              controller
                                                                      .hoveredIndex ==
                                                                  1
                                                          ? theme
                                                              .onPrimaryContainer
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                ),
                                                child: Icon(
                                                  controller.isPLayed
                                                      ? Icons.pause_rounded
                                                      : Icons
                                                          .play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        '${controller.videoPlayerController.value.position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${controller.videoPlayerController.value.position.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Slider(
                                        value:
                                            position.inMilliseconds.toDouble(),
                                        min: 0.0,
                                        max: duration.inMilliseconds.toDouble(),
                                        onChanged:
                                            (value) => controller.seek(value),
                                        activeColor: theme.onTertiary,
                                        inactiveColor: theme.onPrimaryContainer,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        '${((controller.videoPlayerController.value.duration.inSeconds - controller.videoPlayerController.value.position.inSeconds) ~/ 60).toString().padLeft(2, '0')}:${((controller.videoPlayerController.value.duration.inSeconds - controller.videoPlayerController.value.position.inSeconds) % 60).toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    GetBuilder<AnimationsController>(
                                      builder:
                                          (controller) => MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            onEnter: (event) {
                                              controller.isHovered = true;
                                              controller.hoveredIndex = 2;
                                            },
                                            onExit: (event) {
                                              controller.isHovered = false;
                                              controller.hoveredIndex = -1;
                                            },
                                            child: GestureDetector(
                                              onTap:
                                                  () =>
                                                      videoPlayerScreenController
                                                          .overlayPortalController
                                                          .show(),
                                              child: Container(
                                                height: double.infinity,
                                                width: 50,
                                                key:
                                                    videoPlayerScreenController
                                                        .volumePosKey,
                                                decoration: BoxDecoration(
                                                  color:
                                                      controller.isHovered &&
                                                              controller
                                                                      .hoveredIndex ==
                                                                  2
                                                          ? theme
                                                              .onPrimaryContainer
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                ),
                                                child: Icon(
                                                  Icons.volume_up_rounded,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                    ),
                                    OverlayPortal(
                                      controller:
                                          videoPlayerScreenController
                                              .overlayPortalController,
                                      overlayChildBuilder: (context) {
                                        final renderBox =
                                            videoPlayerScreenController
                                                    .volumePosKey
                                                    .currentContext!
                                                    .findRenderObject()
                                                as RenderBox;
                                        final offset = renderBox.localToGlobal(
                                          Offset.zero,
                                        );
                                        return Stack(
                                          children: [
                                            Positioned.fill(
                                              child: GestureDetector(
                                                onTap: () {
                                                  videoPlayerScreenController
                                                      .overlayPortalController
                                                      .hide();
                                                },
                                                behavior:
                                                    HitTestBehavior.opaque,
                                              ),
                                            ),
                                            Positioned(
                                              top: offset.dy - 55,
                                              left: offset.dx - 200,
                                              child: Material(
                                                elevation: 20,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                child: Container(
                                                  height: 50,
                                                  width: 250,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                      30,
                                                      33,
                                                      34,
                                                      1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                  ),
                                                  child: Slider(
                                                    max: 100,
                                                    min: 0,
                                                    value:
                                                        controller
                                                            .videoPlayerController
                                                            .value
                                                            .volume *
                                                        100,
                                                    activeColor:
                                                        theme.onTertiary,
                                                    inactiveColor:
                                                        theme
                                                            .onPrimaryContainer,
                                                    onChanged:
                                                        (value) => controller
                                                            .volume(value),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ],
              );
            } else {
              return const LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
