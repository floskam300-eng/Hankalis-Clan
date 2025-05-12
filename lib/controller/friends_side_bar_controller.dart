import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/services/room_service.dart';

enum InputType { name, email, password }

class FriendsSideBarController extends GetxController {
  final homepageController = Get.find<HomepageController>();
  late final RoomService roomServices;

  List<Map<String, dynamic>> privateRooms = [];
  List<Map<String, dynamic>> publicRooms = [];

  @override
  void onInit() {
    super.onInit();
    initServices();
  }

  void initServices() {
    initializeRoomServices();
    initializeRoomCreated();
    initializePrivateRooms();
    initializePublicRoomCreated();
    initializePublicRooms();
  }

  void initializeRoomServices() {
    roomServices = RoomService(homepageController.socket);
  }

  String? validateInputs(String input, InputType type) {
    if (type == InputType.name) {
      if (input.trim().isEmpty ||
          input.length != "6812f9bd71d72857954a2baf".length) {
        return "Id can't be empty or invalid.";
      }
    } else if (type == InputType.email) {
      if (input.trim().isEmpty) {
        return "Email can't be empty.";
      } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(input)) {
        return "Enter a valid email.";
      }
    } else if (type == InputType.password) {
      if (input.trim().isEmpty) {
        return "Email can't be empty.";
      } else if (!RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
      ).hasMatch(input)) {
        return "Enter a valid password.";
      }
    }
    return null;
  }

  void initializeRoomCreated() {
    roomServices.onRoomCreated((room) {
      try {
        if (room is Map<String, dynamic> && room.containsKey('id')) {
          if (!privateRooms.any((element) => element['id'] == room['id'])) {
            privateRooms.add(room);
            update();
          }
        } else {
          throw Exception("Invalid room data");
        }
      } catch (error) {
        debugPrint("Error in initializeRoomCreated: $error");
      }
    });
  }

  void initializePrivateRooms() {
    roomServices.emitPrivateRooms(homepageController.user['id']);
    roomServices.onPrivateRooms((rooms) {
      try {
        privateRooms.addAll(
          (rooms as List).map((e) => e as Map<String, dynamic>),
        );
        update();
      } catch (error) {
        debugPrint("Error in initializePrivateRooms: $error");
      }
    });
  }

  void initializePublicRooms() {
    roomServices.emitPublicRooms(homepageController.user['id']);
    roomServices.onPublicRooms((rooms) {
      try {
        for (final Map<String, dynamic> room in rooms) {
          room['picture'] = base64Decode(room['picture']);
        }
        publicRooms.addAll(
          (rooms as List).map((e) => e as Map<String, dynamic>),
        );
        update();
      } catch (error) {
        debugPrint("Error in initializePublicRooms: $error");
      }
    });
  }

  void initializePublicRoomCreated() {
    roomServices.onCreatePublicRoom((room) {
      try {
        if (room is Map<String, dynamic> && room.containsKey('id')) {
          if (!publicRooms.any((element) => element['id'] == room['id'])) {
            room['picture'] = base64Decode(room['picture']);
            publicRooms.add(room);
            update();
          } else {
            debugPrint('Already exists');
          }
        } else {
          throw Exception("Invalid room data");
        }
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }
}
