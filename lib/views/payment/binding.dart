import 'package:get/get.dart';

import 'index.dart';




class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentnController());
  }
}
