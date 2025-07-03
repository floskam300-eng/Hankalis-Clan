import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/pick_images_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
                        child: GetBuilder<PickImagesController>(
                          builder:
                              (controller) => Image.memory(
                                chatsController
                                    .pickedFiles[controller.pickedFileIndex]
                                    .bytes!,
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
                                OverlayPortal(
                                  controller:
                                      pickImagesController.overlayPortal,
                                  overlayChildBuilder: (context) {
                                    final RenderBox renderBox =
                                        pickImagesController
                                                .emojisBtnKey
                                                .currentContext!
                                                .findRenderObject()
                                            as RenderBox;
                                    final Offset offset = renderBox
                                        .localToGlobal(Offset.zero);
                                    return Stack(
                                      children: [
                                        Positioned.fill(
                                          child: GestureDetector(
                                            onTap: () {
                                              pickImagesController.overlayPortal
                                                  .hide();
                                            },
                                            behavior: HitTestBehavior.opaque,
                                          ),
                                        ),
                                        Positioned(
                                          top: offset.dy - 300,
                                          left: offset.dx,
                                          child: Material(
                                            elevation: 10,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            child: SizedBox(
                                              height: 300,
                                              width: 350,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                child: EmojiPicker(
                                                  onEmojiSelected:
                                                      (
                                                        Category? category,
                                                        Emoji emoji,
                                                      ) => pickImagesController
                                                          .onEmojiSelected(
                                                            emoji,
                                                          ),
                                                  onBackspacePressed: () {},
                                                  config: Config(
                                                    height: 50,
                                                    checkPlatformCompatibility:
                                                        true,
                                                    emojiViewConfig: EmojiViewConfig(
                                                      gridPadding:
                                                          const EdgeInsets.all(
                                                            5,
                                                          ),
                                                      recentsLimit: 15,
                                                      replaceEmojiOnLimitExceed:
                                                          true,
                                                      loadingIndicator: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                      backgroundColor:
                                                          theme.onSecondary,
                                                      emojiSizeMax:
                                                          20 *
                                                          (foundation.kIsWeb
                                                              ? 1.30
                                                              : 1.0),
                                                    ),
                                                    viewOrderConfig:
                                                        const ViewOrderConfig(
                                                          top:
                                                              EmojiPickerItem
                                                                  .categoryBar,
                                                          middle:
                                                              EmojiPickerItem
                                                                  .emojiView,
                                                        ),
                                                    skinToneConfig:
                                                        const SkinToneConfig(),
                                                    categoryViewConfig:
                                                        CategoryViewConfig(
                                                          backgroundColor:
                                                              theme.onSecondary,
                                                          dividerColor:
                                                              theme
                                                                  .onPrimaryContainer,
                                                          iconColorSelected:
                                                              theme.onTertiary,
                                                          indicatorColor:
                                                              theme.onTertiary,
                                                        ),
                                                    bottomActionBarConfig:
                                                        BottomActionBarConfig(
                                                          enabled: false,
                                                        ),
                                                    searchViewConfig:
                                                        const SearchViewConfig(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
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
                                      if (pickImagesController.pickedFileIndex <
                                          pickImagesController
                                              .captions
                                              .length) {
                                        pickImagesController
                                            .captions[pickImagesController
                                            .pickedFileIndex] = {
                                          'caption': value,
                                        };
                                      } else {
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
                                      pickImagesController.removePickedFile(
                                        pickImagesController.pickedFileIndex,
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
                                                  final isValidIndex =
                                                      index <
                                                      chatsController
                                                          .pickedFiles
                                                          .length;
                                                  return isValidIndex
                                                      ? MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            if (index !=
                                                                pickImagesController
                                                                    .pickedFileIndex) {
                                                              if (index >=
                                                                  pickImagesController
                                                                      .captions
                                                                      .length) {
                                                                pickImagesController
                                                                    .captions
                                                                    .add({});
                                                              }
                                                              pickImagesController
                                                                      .controller
                                                                      .text =
                                                                  pickImagesController
                                                                      .captions[index]['caption'] ??
                                                                  '';
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
                                                                              chatsController.pickedFiles[index].bytes!,
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
