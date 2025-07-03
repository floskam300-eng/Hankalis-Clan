import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:video_player/video_player.dart';
// ignore: deprecated_member_use
import 'dart:html' as html;

class PickVideosController extends GetxController {
  final RxList<Map<String, String>> captions = <Map<String, String>>[].obs;
  final _isHovered = false;

  final overlayPortal = OverlayPortalController();
  final chatsController = Get.find<ChatsController>();

  VideoPlayerController? videoPlayerController;
  List<String> thumbnails = [];

  bool _isEntered = false;

  final scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

  final GlobalKey emojisBtnKey = GlobalKey();

  int _pickedFileIndex = 0;

  bool get isHovered => _isHovered;
  bool get isEntered => _isEntered;
  int get pickedFileIndex => _pickedFileIndex;

  @override
  void onInit() async {
    super.onInit();
    await initVideoPlayer();
    await initThumbnails();
  }

  Future<void> initVideoPlayer() async {
    try {
      await videoPlayerController?.dispose();
      debugPrint(chatsController.pickedFiles[pickedFileIndex].path!);
      videoPlayerController =
          VideoPlayerController.networkUrl(
              Uri.parse(chatsController.pickedFiles[pickedFileIndex].path!),
            )
            ..addListener(() => update())
            ..setLooping(true)
            ..initialize();
    } catch (ex) {
      debugPrint("Error: $ex");
    }
  }

  Future<void> initThumbnails() async {
    thumbnails = [];
    for (var pickVideo in chatsController.pickedFiles) {
      final video =
          html.VideoElement()
            ..src = pickVideo.path!
            ..style.display = 'none'
            ..muted = true;

      html.document.body!.append(video);

      await video.play();
      video.pause();
      video.currentTime = 0;

      await Future.delayed(Duration(milliseconds: 300));

      final canvas = html.CanvasElement(
        width: video.videoWidth,
        height: video.videoHeight,
      );

      final ctx = canvas.context2D;
      ctx.drawImageScaled(video, 0, 0, video.videoWidth, video.videoHeight);

      thumbnails.add(canvas.toDataUrl('image/jpeg', 0.85));
      update();
    }
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController!.dispose();
  }

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

  set isHovered(bool value) {
    isHovered = value;
    update();
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
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
      videoPlayerController = null;
    }
    initVideoPlayer();
    initThumbnails();
  }
}
