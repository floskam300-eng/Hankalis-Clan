import 'package:get/get.dart';
import 'package:hankalis_clan/controller/history_news_controller.dart';

class HistoryNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryNewsController(), fenix: true);
  }
}