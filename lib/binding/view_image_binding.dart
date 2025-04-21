import 'package:get/get.dart';
import 'package:hankalis_clan/controller/view_imag_cotroller.dart';

class ViewImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewImagCotroller(), fenix: true);
  }
}