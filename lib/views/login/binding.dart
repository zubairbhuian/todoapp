import 'package:get/get.dart';
import 'package:todoapp/views/login/controller.dart';



class LogInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
    // TODO: implement dependencies
  }
}
