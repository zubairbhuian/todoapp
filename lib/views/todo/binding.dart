import 'package:get/get.dart';
import 'index.dart';




class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
