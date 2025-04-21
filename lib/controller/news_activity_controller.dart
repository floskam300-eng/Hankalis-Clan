import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/screens/history_news.dart';
import 'package:hankalis_clan/screens/history_slaves.dart';
import 'package:hankalis_clan/screens/sell_slave.dart';
import 'package:hankalis_clan/screens/slave.dart';
import 'package:hankalis_clan/screens/news.dart';

class NewsActivityController extends GetxController {
  final activities = <Widget>[
    News(),
    Slave(),
    SellSlave(),
    HistorySlaves(),
    HistoryNews(),
  ];

  int _selectedActivity = -1;

  int get selectedActivity => _selectedActivity;

  void setSelectedActivity(int index) {
    _selectedActivity = index;
    update();
  }
}
