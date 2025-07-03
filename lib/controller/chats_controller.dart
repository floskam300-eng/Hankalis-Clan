import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:hankalis_clan/widgets/pick_images.dart';
import 'package:hankalis_clan/widgets/pick_videos.dart';

class ChatsController extends GetxController {
  late final ScrollController scrollController;
  final overlayPortalController = OverlayPortalController();

  final attachmentKey = GlobalKey();
  List<PlatformFile> pickedFiles = [];

  bool _isEntered = false;
  int attachmentIndex = -1;

  bool get isEntered => _isEntered;

  @override
  onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  set isEntered(bool value) {
    _isEntered = value;
    update();
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
}
