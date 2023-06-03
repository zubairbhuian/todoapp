import 'package:get/get.dart';
import 'index.dart';


class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
