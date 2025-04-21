import 'package:get/get.dart';
import 'package:hankalis_clan/controller/sell_slave_controller.dart';

class SellSlaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellSlaveController(), fenix: true);
  }
}