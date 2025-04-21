import 'package:get/get.dart';

class ViewImagCotroller extends GetxController {
  late String _photo;

  get photo => _photo;

  @override
  void onInit() {
    super.onInit();
    _photo = Get.arguments;
  }
}
