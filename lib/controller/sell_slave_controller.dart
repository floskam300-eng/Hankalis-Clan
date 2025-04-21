import 'package:get/get.dart';

class SellSlaveController extends GetxController {

  String _selectedMenuItem = "7mod";

  String get selectedMenuItem => _selectedMenuItem;

  set selectedMenuItem(String value) {
    _selectedMenuItem = value;
    update();
  }

}