import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/pick_videos_controller.dart';
import 'package:hankalis_clan/controller/animations_controller.dart';
import 'package:hankalis_clan/widgets/emojis_widget.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:video_player/video_player.dart';

class PickVideos extends StatelessWidget {
  const PickVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final chatsController = Get.find<ChatsController>();
    final pickVideoController = Get.find<PickVideosController>();
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              PanaraConfirmDialog.show(
                context,
                imagePath: "../../assets/confirm.png",
                title: "Discard unsent message?",
                message:
                    "Your message, including attached media, will not be sent if you leave this screen.",
                confirmButtonText: "Discard",
                cancelButtonText: "Cancel",
                onTapCancel: () {
                  Get.back();
                },
                onTapConfirm: () {
                  Get.back();
                  Get.back();
                },
                panaraDialogType: PanaraDialogType.warning,
                barrierDismissible: false,
              );
            },
            behavior: HitTestBehavior.opaque,
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 450),
                decoration: BoxDecoration(
                  color: theme.onSecondary,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder<PickVideosController>(
                        builder:
                            (controller) => Text(
                              chatsController
                                  .pickedFiles[controller.pickedFileIndex]
                                  .name,
                              textAlign: TextAlign.center,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                        left: 10,
                        right: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: GetBuilder<PickVideosController>(
                          builder:
                              (controller) =>
                                  controller.videoPlayerController != null &&
                                          controller
                                              .videoPlayerController!
                                              .value
                                              .isInitialized &&
                                          !controller
                                              .videoPlayerController!
                                              .value
                                              .hasError
                                      ? Container(
                                        color: Colors.black,
                                        constraints: BoxConstraints(
                                          maxHeight: 450,
                                        ),
                                        child: Stack(
                                          children: [
                                            VideoPlayer(
                                              controller.videoPlayerController!,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: 15,
                                                left: 15,
                                              ),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Opacity(
                                                  opacity: 0.5,
                                                  child: Text(
                                                    controller.videoTime() ??
                                                        "00:00",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: 15,
                                              ),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: GetBuilder<
                                                  AnimationsController
                                                >(
                                                  builder:
                                                      (
                                                        thumbnailController,
                                                      ) => Opacity(
                                                        opacity:
                                                            thumbnailController
                                                                    .isHovered
                                                                ? 1
                                                                : 0.5,
                                                        child: MouseRegion(
                                                          cursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          onEnter:
                                                              (event) =>
                                                                  thumbnailController
                                                                          .isHovered =
                                                                      true,
                                                          onExit:
                                                              (event) =>
                                                                  thumbnailController
                                                                          .isHovered =
                                                                      false,
                                                          child: GestureDetector(
                                                            onTap:
                                                                () =>
                                                                    controller
                                                                        .playVideo(),
                                                            child: Image.asset(
                                                              controller
                                                                      .isPlayed
                                                                  ? "../../assets/pause-button.png"
                                                                  : "../../assets/play-button.png",
                                                              height: 32,
                                                              width: 32,
                                                              color:
                                                                  Colors.white,
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
                                      : SizedBox(
                                        height: 300,
                                        width: double.infinity,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                        left: 10,
                        right: 10,
                        top: 5,
                      ),
                      decoration: BoxDecoration(
                        color: theme.onSecondary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                EmojisWidget(
                                  emojisBtnKey:
                                      pickVideoController.emojisBtnKey,
                                  overlayPortalController:
                                      pickVideoController.overlayPortal,
                                  onEmojiSelected:
                                      (category, emoji) => pickVideoController
                                          .onEmojiSelected(emoji),
                                ),
                                GetBuilder<AnimationsController>(
                                  builder:
                                      (controller) => MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        onHover: (_) {
                                          controller.isEntered = true;
                                          controller.hoveredIndex = 1;
                                        },
                                        onExit: (_) {
                                          controller.isEntered = false;
                                          controller.hoveredIndex = -1;
                                        },
                                        child: GestureDetector(
                                          onTap:
                                              () =>
                                                  pickVideoController
                                                      .overlayPortal
                                                      .show(),
                                          child: Container(
                                            key:
                                                pickVideoController
                                                    .emojisBtnKey,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color:
                                                  controller.isEntered &&
                                                          controller
                                                                  .hoveredIndex ==
                                                              1
                                                      ? theme.onPrimaryContainer
                                                      : theme.onSecondary,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.emoji_emotions_outlined,
                                              size: 25,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (pickVideoController.pickedFileIndex <
                                          pickVideoController.captions.length) {
                                        pickVideoController
                                            .captions[pickVideoController
                                            .pickedFileIndex] = {
                                          'caption': value,
                                        };
                                      } else {
                                        pickVideoController.captions.add({
                                          'caption': value,
                                        });
                                      }
                                    },
                                    controller: pickVideoController.controller,
                                    decoration: InputDecoration(
                                      hintText: "Caption (Optional)",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: theme.onSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      pickVideoController.removePickedFile(
                                        pickVideoController.pickedFileIndex,
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: theme.onPrimary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: theme.onPrimaryContainer,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Scrollbar(
                                    controller:
                                        pickVideoController.scrollController,
                                    child: SingleChildScrollView(
                                      controller:
                                          pickVideoController.scrollController,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...List.generate(chatsController.pickedFiles.length, (
                                            index,
                                          ) {
                                            final files =
                                                chatsController.pickedFiles;
                                            final captions =
                                                pickVideoController.captions;
                                            final isValidFileIndex =
                                                index >= 0 &&
                                                index < files.length;
                                            return isValidFileIndex
                                                ? MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      pickVideoController
                                                          .isPlayed = false;
                                                      if (index !=
                                                          pickVideoController
                                                              .pickedFileIndex) {
                                                        // Ensure captions list is long enough
                                                        while (captions
                                                                .length <=
                                                            index) {
                                                          captions.add({});
                                                        }
                                                        final caption =
                                                            captions[index]['caption'] ??
                                                            '';
                                                        pickVideoController
                                                            .controller
                                                            .text = caption;
                                                        pickVideoController
                                                            .setPickedFileIndex(
                                                              index,
                                                            );
                                                      }
                                                    },
                                                    child: GetBuilder<
                                                      PickVideosController
                                                    >(
                                                      builder: (controller) {
                                                        final thumbs =
                                                            controller
                                                                .thumbnails;
                                                        final validThumb =
                                                            index >= 0 &&
                                                            index <
                                                                thumbs.length;
                                                        final validFile =
                                                            index >= 0 &&
                                                            index <
                                                                files.length;
                                                        if (!validThumb ||
                                                            !validFile) {
                                                          return const SizedBox.shrink();
                                                        }
                                                        return Container(
                                                          height: 60,
                                                          width: 50,
                                                          margin:
                                                              const EdgeInsets.only(
                                                                right: 5,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            border:
                                                                controller.pickedFileIndex ==
                                                                        index
                                                                    ? Border(
                                                                      bottom: BorderSide(
                                                                        color:
                                                                            theme.onTertiary,
                                                                        width:
                                                                            3,
                                                                      ),
                                                                    )
                                                                    : null,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      const BorderRadius.all(
                                                                        Radius.circular(
                                                                          10,
                                                                        ),
                                                                      ),
                                                                  child: Opacity(
                                                                    opacity:
                                                                        controller.pickedFileIndex ==
                                                                                index
                                                                            ? 1
                                                                            : 0.5,
                                                                    child: SizedBox(
                                                                      height:
                                                                          60,
                                                                      width: 50,
                                                                      child:
                                                                          (thumbs.isNotEmpty &&
                                                                                  thumbs.length ==
                                                                                      files.length)
                                                                              ? Image.memory(
                                                                                base64Decode(
                                                                                  thumbs[index]
                                                                                      .split(
                                                                                        ',',
                                                                                      )
                                                                                      .last,
                                                                                ),
                                                                                fit:
                                                                                    BoxFit.cover,
                                                                              )
                                                                              : Container(
                                                                                color:
                                                                                    Colors.black,
                                                                                child: const Center(
                                                                                  child: SizedBox(
                                                                                    height:
                                                                                        20,
                                                                                    width:
                                                                                        20,
                                                                                    child:
                                                                                        CircularProgressIndicator(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                )
                                                : const SizedBox.shrink();
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        color: theme.onTertiary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(child: Icon(Icons.send)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}
