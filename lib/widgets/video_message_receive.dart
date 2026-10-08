import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/animations_controller.dart';

class VideoMessageReceive extends StatelessWidget {
  const VideoMessageReceive({
    super.key,
    required this.time,
    required this.message,
    required this.asset,
    required this.index,
  });

  final String time, message, asset;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 11.0, color: Colors.grey.shade600),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints(
                  maxWidth:
                      checkDeviceSize() == DeviceType.mobile
                          ? Get.width * 0.6
                          : Get.width * 0.2,
                ),
                decoration: BoxDecoration(
                  color: theme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GetBuilder<ChatsController>(
                          builder:
                              (controller) =>
                                  controller.thumbnails.isNotEmpty &&
                                          controller.thumbnails.length == 2
                                      ? Container(
                                        height: Get.width * 0.20,
                                        color: Colors.black,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.memory(
                                              base64Decode(
                                                controller.thumbnails[0]
                                                    .split(',')
                                                    .last,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: GetBuilder<
                                                AnimationsController
                                              >(
                                                builder:
                                                    (
                                                      mouseAnimationsController,
                                                    ) => Opacity(
                                                      opacity:
                                                          mouseAnimationsController
                                                                      .isHovered &&
                                                                  mouseAnimationsController
                                                                          .hoveredIndex ==
                                                                      index
                                                              ? 0.8
                                                              : 0.5,
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        padding:
                                                            const EdgeInsets.all(
                                                              10,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              Colors
                                                                  .grey
                                                                  .shade900,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(
                                                                  10,
                                                                ),
                                                              ),
                                                        ),
                                                        child: Center(
                                                          child: MouseRegion(
                                                            cursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            onEnter: (event) {
                                                              mouseAnimationsController
                                                                      .isHovered =
                                                                  true;
                                                              mouseAnimationsController
                                                                      .hoveredIndex =
                                                                  index;
                                                            },
                                                            onExit: (event) {
                                                              mouseAnimationsController
                                                                      .isHovered =
                                                                  false;
                                                              mouseAnimationsController
                                                                  .hoveredIndex = -1;
                                                            },
                                                            child: GestureDetector(
                                                              onTap:
                                                                  () => Get.toNamed(
                                                                    "/home/video",
                                                                    arguments: {
                                                                      "path":
                                                                          "../../assets/my_video.mp4",
                                                                    },
                                                                  ),
                                                              child: Image.asset(
                                                                asset,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      : Container(
                                        color: Colors.black,
                                        width: double.infinity,
                                        height: 200,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            message,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
