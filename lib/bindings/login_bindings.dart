import 'package:get/get.dart';
import 'package:todoapp/controllers/login_controller.dart';

class LogInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
  }
}