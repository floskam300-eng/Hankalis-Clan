import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/model/chat.dart';
import 'package:hankalis_clan/screens/chats.dart';
import 'package:hankalis_clan/screens/games.dart';
import 'package:hankalis_clan/screens/leaderboard.dart';
import 'package:hankalis_clan/screens/news_activity.dart';
import 'package:hankalis_clan/widgets/no_chats.dart';

class SideBarController extends GetxController {
  late List<List<Map<String, dynamic>>> chats;
  Chat selectedChatData = Chat();

  bool _isSideBarOpen = true;
  int _selectedButton = 0;
  int _selectedItem = 0;
  int _selectedChat = -1;

  int get selectedItem => _selectedItem;
  int get selectedButton => _selectedButton;
  int get selectedChat => _selectedChat;
  bool get isSideBarOpen => _isSideBarOpen;

  List<List<Map<String, dynamic>>> getChats(Chat chat) {
    chats = <List<Map<String, dynamic>>>[
      [
        {"message": "Hello ${chat.name}.", "isSender": true},
        {"message": "Can we marry pls?", "isSender": false},
        {"message": "Yes i loved you so much.", "isSender": true},
      ],
      [
        {"message": "Hello ${chat.name}.", "isSender": true},
        {"message": "Can you show me your ass pls?", "isSender": true},
        {"message": "Okay np i will send  photo for you.", "isSender": false},
      ],
      [
        {"message": "Hello ${chat.name}.", "isSender": true},
        {"message": "Hi Shamshom.", "isSender": false},
        {"message": "Can say Yametai Kodasaaaai", "isSender": true},
      ],
    ];
    return chats;
  }

  Widget handleSideBarScreens() {
    if (selectedItem == 0) {
      return selectedChat > -1 && checkDeviceSize() != DeviceType.mobile
          ? Chats()
          : checkDeviceSize() == DeviceType.mobile
          ? SizedBox()
          : NoChats();
    } else if (selectedItem == 1) {
      return Games();
    } else if (selectedItem == 2) {
      return Leaderboard();
    } else if (selectedItem == 3) {
      return NewsActivity();
    }
    return Container();
  }

  void setSelectedChat(int index, Chat selectedChatData) {
    _selectedChat = index;
    this.selectedChatData = selectedChatData;
    update();
  }

  void setSelectedButton(int index) {
    _selectedButton = index;
    update();
  }

  void setSelectedItem(int index) {
    _selectedItem = index;
    update();
  }

  void toggleSideBar() {
    _isSideBarOpen = !_isSideBarOpen;
    update();
  }
}
