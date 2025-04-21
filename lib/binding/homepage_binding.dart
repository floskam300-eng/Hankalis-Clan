import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageController());
  }
}
