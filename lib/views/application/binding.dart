import 'package:get/get.dart';
import 'package:todoapp/views/application/controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
  }
}
