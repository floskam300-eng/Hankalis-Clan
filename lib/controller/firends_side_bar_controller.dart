import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/services/friend_service.dart';
import 'package:toastification/toastification.dart';

enum InputType { name, email, password }

class FirendsSideBarController extends GetxController {
  final homepageController = Get.find<HomepageController>();
  final searchController = TextEditingController();

  late final FriendsService friendsService;

  List<Map<String, dynamic>> friends = [];
  List<Map<String, dynamic>> filteredFriends = [];

  List<Map<String, dynamic>> friendRequest = [];
  List<Map<String, dynamic>> friendReceived = [];

  @override
  void onInit() {
    super.onInit();
    initSerives();
    filteredFriends = friends;
  }

  void initSerives() {
    initialFriendsServices();
    initializeFriends();
    initializeFriendRequestSent();
    friendRequestSent();
    initializeFriendRequestReceived();
    initializeFriendCancelRequest();
    initializeFriendAcceptRequest();
    initFriendDeclineRequest();
    initializeFriendRemove();
  }

  void initialFriendsServices() {
    friendsService = FriendsService(homepageController.socket);
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

  void searchFriends(String name) {
    if (name.trim().isNotEmpty) {
      filteredFriends =
          friends
              .where(
                (friend) => friend['name'].toString().toLowerCase().startsWith(
                  name.toLowerCase(),
                ),
              )
              .toList();
    } else {
      filteredFriends = friends;
    }
    update();
  }

  void initializeFriendAcceptRequest() {
    friendsService.onFriendAcceptRequest((friend) {
      try {
        if (!friends.any((element) => element['id'] == friend['id'])) {
          friendReceived.removeWhere(
            (element) => element['id'] == friend['id'],
          );
          friends.add(friend);
          update();
        }
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void initializeFriendRemove() {
    friendsService.onFriendRemoveRequest((data) {
      try {
        friends.removeWhere((element) => element['id'] == data['id']);
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void friendRemove(String friendId) {
    friendsService.emitFriendRemoveRequest({
      "userId": homepageController.user['id'],
      "friendId": friendId,
    });
  }

  void initFriendDeclineRequest() {
    friendsService.onFriendDeclineRequest((friend) {
      try {
        if (!friends.any((element) => element['id'] != friend['id'])) {
          friendReceived.removeWhere(
            (element) => element['id'] == friend['id'],
          );
          update();
        }
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void emitFriendDeclineRequest(String friendId) {
    friendsService.emitFriendDeclineRequest({
      "userId": friendId,
      "friendId": homepageController.user['id'],
    });
  }

  void emitFriendAcceptRequest(String friendId) {
    friendsService.emitFriendAcceptRequest({
      "userId": homepageController.user['id'],
      "friendId": friendId,
    });
  }

  void initializeFriendRequestReceived() {
    friendsService.emitRequestsReceived(homepageController.user['id']);
    friendsService.onRequestsReceived((data) {
      try {
        friendReceived.addAll(
          (data as List).map((e) => e as Map<String, dynamic>),
        );
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void initializeFriendRequestSent() {
    homepageController.socket.emit("requests", homepageController.user['id']);
    homepageController.socket.on("requests", (data) {
      try {
        friendRequest.addAll(
          (data as List).map((e) => e as Map<String, dynamic>),
        );
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void friendRequestSent() {
    friendsService.onFriendRequestSent((data) {
      try {
        friendRequest.add(data);
        toastification.show(
          title: Text("Friend request sent!"),
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 5),
        );
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void friendRequestReceived() {
    friendsService.onFriendRequestReceived((data) {
      try {
        if (!friendReceived.contains(data)) {
          friendReceived.add(data);
          update();
        }
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void initializeFriendCancelRequest() {
    friendsService.onFriendCancelRequest((friendId) {
      try {
        friendRequest =
            friendRequest
                .where((request) => request['id'] == friendId)
                .toList();
        toastification.show(
          title: Text("Friend request canceled!"),
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 5),
        );
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void friendRequestCancel(String friendId) {
    friendsService.emitFriendCancelRequest({
      "userId": homepageController.user['id'],
      "friendId": friendId,
    });
  }

  void initializeFriends() {
    friendsService.emitFriendsList(homepageController.user['id']);
    friendsService.onFriendsList((friend) {
      try {
        friends.addAll(
          (friend as List).map((e) => e as Map<String, dynamic>).toList(),
        );
        update();
      } catch (error) {
        debugPrint("Error: $error");
      }
    });
  }

  void addFriend(String friendId) {
    friendsService.emitFriendRequest(homepageController.user['id'], friendId);
  }
}
