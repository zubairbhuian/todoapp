import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/widgets/common_func.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  static TodoController get to => Get.find();

  String? currentUser = FirebaseAuth.instance.currentUser!.email;
  final db = FirebaseFirestore.instance;
  String uuid = const Uuid().v4();

  TextEditingController todoTitle = TextEditingController();
  TextEditingController todoDes = TextEditingController();

  bool isButtonDisabled = false;
  
  // !======  Add Todos  ========
  void addTodo(String? userName) async {
    // ### Check inputField
    if (todoTitle.text.isNotEmpty && todoDes.text.isNotEmpty) {
      // ## Loading on
      isButtonDisabled = true;
      update();
      // ## Model Data
      var data = TodoModel(
          id: uuid,
          title: todoTitle.text.trim(),
          body: todoDes.text.trim(),
          addtime: Timestamp.now());
      // ## Check curent title empty or not
      var todoDatabase = await db
          .collection(userName!)
          .withConverter(
            fromFirestore: TodoModel.fromFirestore,
            toFirestore: (TodoModel userData, options) =>
                userData.toFirestore(),
          )
          .where("title", isEqualTo: todoTitle.text.trim())
          .get();
      // Add todos if it is not exidt
      if (todoDatabase.docs.isEmpty) {
        await db
            .collection(userName)
            .doc(uuid)
            .withConverter(
              fromFirestore: TodoModel.fromFirestore,
              toFirestore: (TodoModel todos, options) => todos.toFirestore(),
            )
            .set(data);
        // Create New UUID
        uuid = const Uuid().v4();
        // Close the model
        Get.back();
        // loading off
        isButtonDisabled = false;
        update();
        // await for some time
        await Future.delayed(const Duration(seconds: 1));
        // successfull MSG show
        customSnackbar(msg: "Todo successfully added");
        // clear all the textField
        todoTitle.clear();
        todoDes.clear();
      } else {
        // title existed MSG show
        customSnackbar(msg: "This title already existed");
        // loading off
        isButtonDisabled = false;
        update();
      }
    } else {
      customSnackbar(msg: "you must have a title and description");
    }
  }

  //  !===== Delete todo =======
  void deleteTodo(String id) async {
    try {
      await db.collection(currentUser!).doc(id).delete();
      customSnackbar(msg: 'Document deleted successfully.');
    } catch (e) {
      customSnackbar(msg: 'Oops! there is a problem, please try again later');
      log('Error deleting document: $e');
    }
  }

  // !==== todoUpdate ======
  void todoUpdate(String id) async {
    // ### Check inputField
    if (todoTitle.text.isNotEmpty && todoDes.text.isNotEmpty) {
      // ## Loading on
      isButtonDisabled = true;
      update();
      try {
        var data = TodoModel(
            id: id,
            title: todoTitle.text.trim(),
            body: todoDes.text.trim(),
            addtime: Timestamp.now());
        await db
            .collection(currentUser!)
            .doc(id)
            .withConverter(
              fromFirestore: TodoModel.fromFirestore,
              toFirestore: (TodoModel todos, options) => todos.toFirestore(),
            )
            .set(data);
        Get.back();
        customSnackbar(msg: 'Document updated successfully.');
      } catch (e) {
        customSnackbar(msg: 'Oops! there is a problem, please try again later');
        log('Error updating document: $e');
      }
      isButtonDisabled = false;
      update();
    }
  }

  @override
  void onInit() {
    // ## remove dot from the currentUser
    currentUser = currentUser!.replaceAll('.', '');
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
