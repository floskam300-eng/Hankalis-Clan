import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/services/message.dart';
import 'package:hankalis_clan/widgets/pick_document.dart';
import 'package:hankalis_clan/widgets/pick_images.dart';
import 'package:hankalis_clan/widgets/pick_videos.dart';

import 'package:hankalis_clan/model/message.dart' as message_model;

// ignore: deprecated_member_use
import 'dart:html' as html;

class ChatsController extends GetxController {
  final homepageController = Get.find<HomepageController>();

  List<String> thumbnails = [];
  final controller = TextEditingController();

  late final ScrollController scrollController;

  late final OverlayPortalController overlayPortalController;
  late final OverlayPortalController emojisOverlayPortalController;

  final attachmentKey = GlobalKey();
  final formKey = GlobalKey<FormState>();

  List<PlatformFile> pickedFiles = [];

  int attachmentIndex = -1;

  @override
  onInit() async {
    super.onInit();
    await initVariables();
  }

  void onEmojiSelected(Emoji emoji) {
    final text = controller.text;
    final selection = controller.selection;
    final newText = text.replaceRange(
      selection.start,
      selection.end,
      emoji.emoji,
    );
    controller.text = newText;
    controller.selection = TextSelection.collapsed(
      offset: selection.start + emoji.emoji.length,
    );
  }

  String? validator(String? value) {
    if (value!.trim().isEmpty) {
      return "Message can't be empty.";
    }
    return null;
  }

  String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<void> initVariables() async {
    overlayPortalController = OverlayPortalController();
    emojisOverlayPortalController = OverlayPortalController();
    scrollController = ScrollController();
    await initThumbnails('assets/my_video.mp4');
    await initThumbnails('assets/my_video_2.mp4');
  }

  Future<void> initThumbnails(String assetPath) async {
    final video =
        html.VideoElement()
          ..src = assetPath
          ..style.display = 'none'
          ..muted = true;

    html.document.body!.append(video);
    await video.onLoadedMetadata.first;

    video.currentTime = 0;
    await video.onSeeked.first;

    final canvas = html.CanvasElement(
      width: video.videoWidth,
      height: video.videoHeight,
    );

    final ctx = canvas.context2D;
    ctx.drawImageScaled(video, 0, 0, video.videoWidth, video.videoHeight);

    thumbnails.add(canvas.toDataUrl('image/jpeg', 0.85));
    update();

    video.remove();
  }

  void sendMessage({required String roomId, String? message}) {
    if (formKey.currentState!.validate()) {
      Message(homepageController.socket).sendMessage(
        message_model.Message(
          roomId: roomId,
          senderId: homepageController.user['id'],
          text: message ?? controller.text,
        ),
      );
      controller.clear();
    }
  }

  void addAttachmentPhotos() async {
    final pickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (pickerResult != null) {
      pickedFiles.clear();
      for (PlatformFile file in pickerResult.files) {
        pickedFiles.add(file);
      }

      Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) => PickImages(),
      );
    }
  }

  void addAttachmentVideos() async {
    final pickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.video,
    );

    if (pickerResult != null) {
      pickedFiles.clear();
      for (PlatformFile file in pickerResult.files) {
        pickedFiles.add(file);
      }

      Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) => PickVideos(),
      );
    }
  }

  void addAttachmentDocuments() async {
    final pickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
      withData: true,
    );

    if (pickerResult != null) {
      pickedFiles.clear();
      for (PlatformFile file in pickerResult.files) {
        pickedFiles.add(file);
      }

      Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) => PickDocument(),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
