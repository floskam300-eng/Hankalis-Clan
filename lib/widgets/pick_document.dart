import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/pick_document_controller.dart';
import 'package:hankalis_clan/widgets/emojis_widget.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class PickDocument extends StatelessWidget {
  const PickDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final chatsController = Get.find<ChatsController>();
    final pickDocumentController = Get.find<PickDocumentController>();
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
                      child: GetBuilder<PickDocumentController>(
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
                      child: GetBuilder<PickDocumentController>(
                        builder: (controller) {
                          final files = chatsController.pickedFiles;
                          final idx = controller.pickedFileIndex;
                          final valid =
                              files.isNotEmpty &&
                              idx >= 0 &&
                              idx < files.length;
                          return Container(
                            height: 300,
                            width: 400,
                            decoration: BoxDecoration(
                              color: theme.onPrimary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.insert_drive_file_rounded,
                                  size: 50,
                                  color: Colors.white54,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  valid ? files[idx].name : "No file selected",
                                  style: TextStyle(color: Colors.white54),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  valid
                                      ? "${controller.formatBytes(files[idx].size)}, ${files[idx].extension.toString().toUpperCase()} File"
                                      : "",
                                  style: TextStyle(color: Colors.white54),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
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
                                      pickDocumentController.emojisBtnKey,
                                  overlayPortalController:
                                      pickDocumentController.overlayPortal,
                                  onEmojiSelected:
                                      (category, emoji) =>
                                          pickDocumentController
                                              .onEmojiSelected(emoji),
                                ),
                                GetBuilder<PickDocumentController>(
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
                                          pickDocumentController
                                              .pickedFileIndex;
                                      if (idx >= 0 &&
                                          idx <
                                              pickDocumentController
                                                  .captions
                                                  .length) {
                                        pickDocumentController.captions[idx] = {
                                          'caption': value,
                                        };
                                      } else if (idx >= 0) {
                                        while (pickDocumentController
                                                .captions
                                                .length <
                                            idx) {
                                          pickDocumentController.captions.add(
                                            {},
                                          );
                                        }
                                        pickDocumentController.captions.add({
                                          'caption': value,
                                        });
                                      }
                                    },
                                    controller:
                                        pickDocumentController.controller,
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
                                          pickDocumentController
                                              .pickedFileIndex;
                                      final files = chatsController.pickedFiles;
                                      if (files.isNotEmpty &&
                                          idx >= 0 &&
                                          idx < files.length) {
                                        pickDocumentController.removePickedFile(
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
                                        pickDocumentController.scrollController,
                                    child: SingleChildScrollView(
                                      controller:
                                          pickDocumentController
                                              .scrollController,
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
                                                      pickDocumentController
                                                          .captions;
                                                  final isValidFileIndex =
                                                      index >= 0 &&
                                                      index < files.length;
                                                  return isValidFileIndex
                                                      ? MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            if (index !=
                                                                pickDocumentController
                                                                    .pickedFileIndex) {
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
                                                              pickDocumentController
                                                                      .controller
                                                                      .text =
                                                                  caption;
                                                              pickDocumentController
                                                                  .setPickedFileIndex(
                                                                    index,
                                                                  );
                                                            }
                                                          },
                                                          child: GetBuilder<
                                                            PickDocumentController
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
                                                                            child: SizedBox(
                                                                              height:
                                                                                  60,
                                                                              width:
                                                                                  50,
                                                                              child: FittedBox(
                                                                                child: Icon(
                                                                                  Icons.insert_drive_file_rounded,
                                                                                  color:
                                                                                      Colors.white,
                                                                                ),
                                                                              ),
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
