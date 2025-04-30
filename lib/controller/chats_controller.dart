import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';

class ChatsController extends GetxController {
  late HomepageController controller;

  @override
  void onInit() {
    super.onInit();
    controller = Get.find();
  }

  Future<void> readFile() async {
  try {
    final FilePickerResult? loadFile = await FilePicker.platform.pickFiles();

    if (loadFile == null) {
      debugPrint("No file loaded...");
      return;
    }

    final PlatformFile file = loadFile.files.first;
    final String base64PictureData = base64Encode(file.bytes!); // Encode bytes to base64

    debugPrint(
      "File Name: ${file.name.toString().split('.')[0]},\nFile Extension: ${file.extension},\nFile Data: ${base64PictureData.substring(0, 100)}...", // Log only the first 100 characters
    );

    controller.socket.emit("create_room", {
      "room": {
        "name": "My New Room",
        "description": "This is a test room",
        "type": "public",
        "admin": controller.user['id'],
        "participants": [
          "680c05851f12053393d9048f",
          "680c0c691f12053393d90497",
        ],
        "messages": [],
      },
      "pictureData": base64PictureData,
      "pictureExtension": file.extension,
    });
  } catch (error) {
    debugPrint(error.toString());
  }
}
}
