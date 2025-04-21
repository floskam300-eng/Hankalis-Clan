import 'package:get/get.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';

class NewsActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsActivityController(), fenix: true);
  }
}
