import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:video_player/video_player.dart';
// ignore: deprecated_member_use
import 'dart:html' as html;

class PickVideosController extends GetxController {
  final RxList<Map<String, String>> captions = <Map<String, String>>[].obs;

  final overlayPortal = OverlayPortalController();
  final chatsController = Get.find<ChatsController>();

  VideoPlayerController? videoPlayerController;
  List<String> thumbnails = [];

  bool _isPlayed = false;

  final scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

  final GlobalKey emojisBtnKey = GlobalKey();

  int _pickedFileIndex = 0;

  bool get isPlayed => _isPlayed;

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
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(chatsController.pickedFiles[pickedFileIndex].path!),
      );
      await videoPlayerController!.setLooping(true);
      await videoPlayerController!.setVolume(0.2);
      await videoPlayerController!.initialize();
      update();
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

  set isPlayed(bool value) {
    _isPlayed = value;
    update();
  }

  void removePickedFile(int index) {
    if (index >= 0 && index < chatsController.pickedFiles.length) {
      chatsController.pickedFiles.removeAt(index);
      if (index < thumbnails.length) {
        thumbnails.removeAt(index);
      }
      if (index < captions.length) {
        captions.removeAt(index);
      }

      if (chatsController.pickedFiles.isEmpty) {
        Get.back();
        return;
      }

      if (index < _pickedFileIndex) {
        _pickedFileIndex--;
      } else if (index == _pickedFileIndex) {
        if (_pickedFileIndex >= chatsController.pickedFiles.length) {
          _pickedFileIndex = chatsController.pickedFiles.length - 1;
        }
      }

      if (_pickedFileIndex >= 0) {
        initVideoPlayer();
      }

      chatsController.update();
      update();
    }
  }

  void playVideo() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isPlayed = false;
      } else {
        videoPlayerController!.play();
        isPlayed = true;
      }
      update();
    }
  }

  String? videoTime() {
    if (videoPlayerController != null &&
        videoPlayerController!.value.isInitialized) {
      final duration = videoPlayerController!.value.duration;
      final minutes = duration.inMinutes
          .remainder(60)
          .toString()
          .padLeft(2, '0');
      final seconds = duration.inSeconds
          .remainder(60)
          .toString()
          .padLeft(2, '0');
      return '$minutes:$seconds';
    }
    return null;
  }

  void setPickedFileIndex(int index) {
    if (index >= 0 && index < chatsController.pickedFiles.length) {
      _pickedFileIndex = index;
      initVideoPlayer();
      update();
    }
  }
}
