import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/services/room_service.dart';

enum InputType { name, email, password }

class FirendsSideBarController extends GetxController {
  final homepageController = Get.find<HomepageController>();

  late final RoomService roomServices;
  List<Map<String, dynamic>> rooms = [];

  @override
  void onInit() {
    super.onInit();
    initSerives();
  }

  void initSerives() {
    initialaizeRoomServices();
    initializeRoomCreated();
    initializePrivateRooms();
  }

  void initialaizeRoomServices() {
    roomServices = RoomService(homepageController.socket);
  }

  String? valideInputes(String input, InputType type) {
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
          if (!rooms.any((element) => element['id'] == room['id'])) {
            rooms.add(room);
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
        this.rooms.addAll(
          (rooms as List).map((e) => e as Map<String, dynamic>),
        );
        update();
      } catch (error) {
        debugPrint("Error in initializePrivateRooms: $error");
      }
    });
  }
  
}
