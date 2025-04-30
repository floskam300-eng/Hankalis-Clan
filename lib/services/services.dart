import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {

  static late SharedPreferences storage;

  @override
  void onInit() async {
    super.onInit();
    storage = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint("Services initialized!");
  }

}