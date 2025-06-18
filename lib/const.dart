import 'package:get/get.dart';

enum DeviceType { mobile, desktop }

// ignore: constant_identifier_names
const String DOMAIN = "localhost:3000";

DeviceType checkDeviceSize() {
  final width = Get.width;
  if (width < 600) {
    return DeviceType.mobile;
  } else {
    return DeviceType.desktop;
  }
}
