import 'package:get/get.dart';
import 'package:hankalis_clan/controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController(), fenix: true);
  }
}