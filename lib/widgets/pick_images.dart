import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/pick_images_controller.dart';
import 'package:hankalis_clan/widgets/emojis_widget.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class PickImages extends StatelessWidget {
  const PickImages({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final chatsController = Get.find<ChatsController>();
    final pickImagesController = Get.find<PickImagesController>();
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
                      child: GetBuilder<PickImagesController>(
                        builder: (controller) {
                          final files = chatsController.pickedFiles;
                          final idx = controller.pickedFileIndex;
                          final valid =
                              files.isNotEmpty &&
                              idx >= 0 &&
                              idx < files.length;
                          return Text(
                            valid ? files[idx].name : "No file selected",
                            textAlign: TextAlign.center,
                          );
                        },
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
                        child: GetBuilder<PickImagesController>(
                          builder: (controller) {
                            final files = chatsController.pickedFiles;
                            final idx = controller.pickedFileIndex;
                            final valid =
                                files.isNotEmpty &&
                                idx >= 0 &&
                                idx < files.length &&
                                files[idx].bytes != null;
                            return valid
                                ? Image.memory(files[idx].bytes!)
                                : Container(
                                  height: 300,
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  child: Center(
                                    child: Text("No image selected"),
                                  ),
                                );
                          },
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
                                      pickImagesController.emojisBtnKey,
                                  overlayPortalController:
                                      pickImagesController.overlayPortal,
                                  onEmojiSelected:
                                      (category, emoji) => pickImagesController
                                          .onEmojiSelected(emoji),
                                ),
                                GetBuilder<PickImagesController>(
                                  builder:
                                      (controller) => MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        onHover:
                                            (_) => controller.isEntered = true,
                                        onExit:
                                            (_) => controller.isEntered = false,
                                        child: GestureDetector(
                                          onTap:
                                              () =>
                                                  controller.overlayPortal
                                                      .show(),
                                          child: Container(
                                            key: controller.emojisBtnKey,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color:
                                                  controller.isEntered
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
                                      final idx =
                                          pickImagesController.pickedFileIndex;
                                      if (idx >= 0 &&
                                          idx <
                                              pickImagesController
                                                  .captions
                                                  .length) {
                                        pickImagesController.captions[idx] = {
                                          'caption': value,
                                        };
                                      } else if (idx >= 0) {
                                        while (pickImagesController
                                                .captions
                                                .length <
                                            idx) {
                                          pickImagesController.captions.add({});
                                        }
                                        pickImagesController.captions.add({
                                          'caption': value,
                                        });
                                      }
                                    },
                                    controller: pickImagesController.controller,
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
                                      final idx =
                                          pickImagesController.pickedFileIndex;
                                      final files = chatsController.pickedFiles;
                                      if (files.isNotEmpty &&
                                          idx >= 0 &&
                                          idx < files.length) {
                                        pickImagesController.removePickedFile(
                                          idx,
                                        );
                                      }
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
                                        pickImagesController.scrollController,
                                    child: SingleChildScrollView(
                                      controller:
                                          pickImagesController.scrollController,
                                      scrollDirection: Axis.horizontal,
                                      child: GetBuilder<ChatsController>(
                                        builder:
                                            (controller) => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ...List.generate(controller.pickedFiles.length, (
                                                  index,
                                                ) {
                                                  final files =
                                                      chatsController
                                                          .pickedFiles;
                                                  final captions =
                                                      pickImagesController
                                                          .captions;
                                                  final isValidFileIndex =
                                                      index >= 0 &&
                                                      index < files.length &&
                                                      files[index].bytes !=
                                                          null;
                                                  return isValidFileIndex
                                                      ? MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            if (index !=
                                                                pickImagesController
                                                                    .pickedFileIndex) {
                                                              // Ensure captions list is long enough
                                                              while (captions
                                                                      .length <=
                                                                  index) {
                                                                captions.add(
                                                                  {},
                                                                );
                                                              }
                                                              final caption =
                                                                  captions[index]['caption'] ??
                                                                  '';
                                                              pickImagesController
                                                                      .controller
                                                                      .text =
                                                                  caption;
                                                              pickImagesController
                                                                  .setPickedFileIndex(
                                                                    index,
                                                                  );
                                                            }
                                                          },
                                                          child: GetBuilder<
                                                            PickImagesController
                                                          >(
                                                            builder:
                                                                (
                                                                  controller,
                                                                ) => Container(
                                                                  height: 60,
                                                                  width: 50,
                                                                  margin:
                                                                      EdgeInsets.only(
                                                                        right:
                                                                            5,
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
                                                                          borderRadius: BorderRadius.all(
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
                                                                            child: Image.memory(
                                                                              files[index].bytes!,
                                                                              height:
                                                                                  60,
                                                                              width:
                                                                                  50,
                                                                              fit:
                                                                                  BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                          ),
                                                        ),
                                                      )
                                                      : SizedBox.shrink();
                                                }),
                                              ],
                                            ),
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
