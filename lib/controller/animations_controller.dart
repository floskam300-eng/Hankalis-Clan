import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AnimationsController extends GetxController {
  int hoveredIndex = -1;

  bool _isPLayed = true;

  bool _isHovered = false;
  bool _isEntered = false;
  bool _isHovered_2 = false;

  bool get isPLayed => _isPLayed;

  bool get isHovered => _isHovered;
  bool get isHovered_2 => _isHovered_2;
  bool get isEntered => _isEntered;

  set isPLayed(bool value) {
    _isPLayed = value;
    update();
  }

  set isHovered(bool value) {
    _isHovered = value;
    update();
  }

  set isEntered(bool value) {
    _isEntered = value;
    update();
  }

  set isHovered_2(bool value) {
    _isHovered_2 = value;
    update();
  }
}
