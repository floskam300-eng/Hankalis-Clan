import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LeaderboardController extends GetxController {
  int _selectedCategory = -1;

  int get selectedCategory => _selectedCategory;

  void setSelectedCategory(int index) {
    _selectedCategory = index;
    update();
  }
}
