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
  Map<String, dynamic> todosList = {};

  // Add Todos
  void addTodo(String refPath, String? userName) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('todo').child(userName!).child(todoTitle.text);
    if (todoTitle.text.isNotEmpty && todoDes.text.isNotEmpty) {
      isButtonDisabled = true;
      update();
      await ref.set({"id": refPath, "title": todoTitle.text, "des": todoDes.text});
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
      isButtonDisabled = false;
      update();
      todoTitle.clear();
      todoDes.clear();
      uuid = const Uuid().v4();
      customSnackbar(msg: "Todo Added");
    } else {
      customSnackbar(msg: "You can't emty the field");
    }
  }

// Get Todo
  void getTodos(String? userName) {
    try {
      DatabaseReference starCountRef =
          FirebaseDatabase.instance.ref('todo/$userName');
      starCountRef.onValue.listen((DatabaseEvent event) {
        var data = event.snapshot.value;

        print(data);
      });
    } catch (e) {
      print("could not get");
    }
  }

  @override
  void onInit() {
    currentUser = currentUser!.replaceAll('.', '');

    print(currentUser);
    getTodos(currentUser);
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
