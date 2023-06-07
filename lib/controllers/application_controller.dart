import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/core/utils/app_constant.dart';

class ApplicationController extends GetxController {
  int pageIndex = 3;
  List products = [];
  bool isLoading = false;

  void pageControll(int index) {
    pageIndex = index;
    update();
  }

  fetechdata() async {
    isLoading = true;
    var url = Uri.parse('${AppConstan.baseURL}/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      products = data;
      isLoading = false;
      update();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void onInit() {
    fetechdata();
    super.onInit();
  }
}
