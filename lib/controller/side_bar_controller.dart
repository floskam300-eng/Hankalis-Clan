import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/screens/chats.dart';
import 'package:hankalis_clan/screens/games.dart';
import 'package:hankalis_clan/screens/leaderboard.dart';
import 'package:hankalis_clan/screens/news_activity.dart';
import 'package:hankalis_clan/widgets/no_chats.dart';

class SideBarController extends GetxController {
  bool _isSideBarOpen = true;
  int _selectedButton = 0;
  int _selectedItem = 0;

  int get selectedItem => _selectedItem;
  int get selectedButton => _selectedButton;
  bool get isSideBarOpen => _isSideBarOpen;

  Widget handleSideBarScreens() {
    if (selectedItem == 0) {
      return checkDeviceSize() != DeviceType.mobile
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
