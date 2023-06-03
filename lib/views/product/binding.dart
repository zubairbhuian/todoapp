import 'package:get/get.dart';

import 'index.dart';


class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
