import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/services/room_service.dart';

class CreatePublicRoomController extends GetxController {
  late final RoomService roomServices;
  final homepageController = Get.find<HomepageController>();
  File? file;

  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController roomDescriptionController =
      TextEditingController();

  bool _isBtnEnabled = false;

  bool _isHovered = false;
  final List<Map<String, dynamic>> _chips = [];
  final List<Map<String, dynamic>> _friends = [];

  List<Map<String, dynamic>>? get getChips => _chips;
  List<Map<String, dynamic>>? get getFriends => _friends;
  
  bool get isBtnEnabled => _isBtnEnabled;
  bool get isHovered => _isHovered;

  @override
  void onInit() {
    super.onInit();
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

      file = File(result.files.first.path!);
      debugPrint("File: ${file!.path}");

      update();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  set isBtnEnabled(bool value) {
    _isBtnEnabled = value;
    update();
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
