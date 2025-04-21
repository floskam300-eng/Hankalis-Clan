import 'package:get/instance_manager.dart';
import 'package:hankalis_clan/controller/games_controller.dart';

class GamesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GamesController(), fenix: true);
  }
}
