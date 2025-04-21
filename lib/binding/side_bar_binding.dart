import 'package:get/get.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';

class SideBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SideBarController(), fenix: true);
  }
}
