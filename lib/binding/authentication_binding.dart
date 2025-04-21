import 'package:get/get.dart';
import 'package:hankalis_clan/controller/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
