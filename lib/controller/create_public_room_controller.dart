import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/services/room_service.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class CreatePublicRoomController extends GetxController {
  late final RoomService roomServices;
  final homepageController = Get.find<HomepageController>();

  File? file;
  PlatformFile? pickedFile;

  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController roomDescriptionController =
      TextEditingController();

  bool _isHovered = false;
  final List<Map<String, dynamic>> _chips = [];
  final List<Map<String, dynamic>> _friends = [];

  List<Map<String, dynamic>>? get getChips => _chips;
  List<Map<String, dynamic>>? get getFriends => _friends;

  bool get isHovered => _isHovered;

  @override
  void onInit() {
    super.onInit();
    initializeServices();
  }

  void initializeServices() {
    initializeRoomService();
    initializeFriends();
  }

  void initializeRoomService() {
    roomServices = RoomService(homepageController.socket);
  }

  void initializeFriends() {
    roomServices.emitFriends(homepageController.user['id']);
    roomServices.onFriends((friends) {
      try {
        for (Map<String, dynamic> friend in friends) {
          _friends.add({
            'id': friend['id'],
            'name': friend['name'],
            'photo': friend['photoUrl'],
            "email": friend['email'],
            "index": _friends.length,
          });
        }
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void createRoom() async {
    if (roomNameController.text.trim().isEmpty ||
        roomDescriptionController.text.trim().isEmpty ||
        getChips == null ||
        getChips!.isEmpty) {
      PanaraInfoDialog.show(
        Get.context!,
        title: "Create Room",
        message:
            "You must fill Name and Description fields and members must be at least one",
        buttonText: "Close",
        onTapDismiss: () => Get.back(),
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
      );
    } else {
      try {
        final String imageBase64;

        if (file == null) {
          final ByteData imageData = await rootBundle.load('assets/user.png');
          imageBase64 = base64Encode(imageData.buffer.asUint8List());
        } else {
          imageBase64 = base64Encode(pickedFile!.bytes!);
        }

        Map<String, dynamic> room = {
          "room": {
            "name": roomNameController.text.trim(),
            "description": roomDescriptionController.text.trim(),
            "type": "public",
            "admin": homepageController.user['id'],
            "participants": _chips.map((e) => e['id']).toList(),
            "messages": [],
          },
          "pictureData": imageBase64,
          "pictureExtension":
              file == null ? "png" : pickedFile!.name.split(".")[1],
        };

        roomServices.emitCreatePublicRoom(room);
        Get.back();
      } catch (error) {
        debugPrint("Error reading file: ${error.toString()}");
      }
    }
  }

  Future<void> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result == null) {
        debugPrint('No file selected.');
        return;
      }

      pickedFile = result.files.first;
      file = File(result.files.first.path!);

      update();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  set friends(Map<String, dynamic> value) {
    _friends.add(value);
    update();
  }

  set chips(Map<String, dynamic> value) {
    _chips.add(value);
    update();
  }

  void removeFriend(int index) {
    _friends.removeAt(index);
    update();
  }

  void removeChip(int index) {
    _chips.removeAt(index);
    update();
  }

  void setIsHovered(bool value) {
    _isHovered = value;
    update();
  }
}
