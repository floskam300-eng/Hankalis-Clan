import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';

class PickImagesController extends GetxController {
  final RxList<Map<String, String>> captions = <Map<String, String>>[].obs;

  final overlayPortal = OverlayPortalController();
  final chatsController = Get.find<ChatsController>();

  bool _isEntered = false;

  final scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();
  final GlobalKey emojisBtnKey = GlobalKey();

  int _pickedFileIndex = 0;

  bool get isEntered => _isEntered;
  int get pickedFileIndex => _pickedFileIndex;

  void onEmojiSelected(Emoji emoji) {
    final newText = controller.text + emoji.emoji;
    controller.text = newText;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: newText.length),
    );

    if (pickedFileIndex < captions.length) {
      captions[pickedFileIndex] = {'caption': newText};
    } else {
      captions.add({'caption': newText});
    }
  }

  set isEntered(bool value) {
    _isEntered = value;
    update();
  }

  void removePickedFile(int index) {
    if (index >= 0 && index < chatsController.pickedFiles.length) {
      if (index < captions.length) {
        captions.removeAt(index);
      }
      chatsController.pickedFiles.removeAt(index);
      if (chatsController.pickedFiles.isEmpty) {
        Get.back();
      } else {
        final newIndex =
            index >= chatsController.pickedFiles.length
                ? chatsController.pickedFiles.length - 1
                : index > 0
                ? index - 1
                : 0;
        setPickedFileIndex(newIndex);
      }
      chatsController.update();
    }
  }

  void setPickedFileIndex(int index) {
    _pickedFileIndex = index;
    update();
  }
}
