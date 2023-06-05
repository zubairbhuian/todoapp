import 'package:get/get.dart';
import 'package:todoapp/controllers/application_controller.dart';
import 'package:todoapp/controllers/todo_controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => TodoController());
  }
}
