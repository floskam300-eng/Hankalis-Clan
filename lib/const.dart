import 'package:get/get.dart';

enum DeviceType { mobile, desktop }

DeviceType checkDeviceSize() {
  final width = Get.width;
  if (width < 600) {
    return DeviceType.mobile;
  }  else {
    return DeviceType.desktop;
  }
}