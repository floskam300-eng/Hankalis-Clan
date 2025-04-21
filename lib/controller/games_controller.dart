import 'package:get/get.dart';

class GamesController extends GetxController {
  int _selectedCategory = -1;

  int get selectedCategory => _selectedCategory;

  void setSelectedCategory(int index) {
    _selectedCategory = index;
    update();
  }
}
