import 'package:get/get.dart';
import 'package:todoapp/controllers/regestration_controller.dart';

class RegestrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegestrationController());
  }
}
