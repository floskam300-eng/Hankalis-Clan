import 'package:get/get.dart';
import 'package:hankalis_clan/controller/history_slaves_controller.dart';

class HistorySlavesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistorySlavesController(), fenix: true);
  }
}