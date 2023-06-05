import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/widgets/common_func.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  static TodoController get to => Get.find();
  String? currentUser = FirebaseAuth.instance.currentUser!.email;

  TextEditingController todoTitle = TextEditingController();
  TextEditingController todoDes = TextEditingController();
  String uuid = const Uuid().v4();
  bool isButtonDisabled = false;
  int demo = 0;

  // Add Todoes
  addTodo(String refPath, String? userName) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('todo').child(userName!).child(refPath);
    if (todoTitle.text.isNotEmpty && todoDes.text.isNotEmpty) {
      isButtonDisabled = true;
      update();
      await ref.set({"title": todoTitle.text, "des": todoDes.text});
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
      isButtonDisabled = true;
      update();
      todoTitle.clear();
      todoDes.clear();
      uuid = const Uuid().v4();
      customSnackbar(msg: "Todo Added");
    } else {
      customSnackbar(msg: 'Do some thing');
    }
  }
// Get Todo

  @override
  void onInit() {
    currentUser = currentUser!.replaceAll('.', '');
    String originalText = 'Hello@World.com';
    String modifiedText = originalText.replaceAll('.', '');
    print(currentUser);
    super.onInit();
  }

  @override
  void dispose() {
    todoTitle.dispose();
    todoDes.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
