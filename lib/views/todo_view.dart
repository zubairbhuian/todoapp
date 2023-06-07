import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/core/utils/app_color.dart';
import 'package:todoapp/widgets/custom_widgets.dart';
import 'package:todoapp/widgets/dialogs.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColorOne,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(controller.currentUser!)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return TodosCard(
                            title: data['title'],
                            body: data['body'],
                            lastEdit: '',
                            onEdit: () => {
                                  controller.todoTitle = TextEditingController(
                                      text: data['title']),
                                  controller.todoDes =
                                      TextEditingController(text: data['body']),
                                  todosDialog(
                                      btnText: 'Update',
                                      todoTitle: controller.todoTitle,
                                      todoDes: controller.todoDes,
                                      onPressed: () {
                                        controller.todoUpdate(data['id']);
                                      }),
                                },
                            onDelete: () => {
                                  permissionDialog(
                                      msg:
                                          're you sure you want to delete the documents?',
                                      onCancel: () {
                                        Get.back();
                                      },
                                      onConfirm: () {
                                        controller.deleteTodo(data['id']);
                                        Get.back();
                                      })
                                });
                      }).toList(),
                    );
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 120.sw,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 6.h)),
                    onPressed: () {
                      todosDialog(
                        btnText: 'Add',
                        todoTitle: controller.todoTitle,
                        todoDes: controller.todoDes,
                        onPressed: () {
                          controller.addTodo(controller.currentUser);
                        },
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
