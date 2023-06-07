import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/core/utils/app_color.dart';
import 'package:todoapp/widgets/custom_text.dart';

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
                        return Container(
                          width: 120.sw,
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(62, 167, 11, 214),
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RegularText(
                                text: data['title'],
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Color.fromARGB(255, 105, 105, 105),
                              ),
                              RegularText(text: data['body']),
                              SizedBox(
                                height: 10.w,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: 35.w,
                                      height: 35.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: const Color.fromARGB(
                                            164, 169, 24, 226),
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 35.w,
                                      height: 35.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: const Color.fromARGB(
                                            164, 169, 24, 226),
                                      ),
                                      child: const Icon(
                                        Icons.delete,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.defaultDialog(
                                          content: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            const RegularText(
                                                textAlign: TextAlign.center,
                                                text:
                                                    'Are you sure you want to delete the documents?'),
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            SizedBox(
                                              width: 120.sw,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const RegularText(
                                                        text: 'No',
                                                        color: AppColor.white,
                                                      )),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        controller.deleteTodo(
                                                            data['id']);
                                                        Get.back();
                                                      },
                                                      child: const RegularText(
                                                          text: 'Yes',
                                                          color:
                                                              AppColor.white)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
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
                      Get.defaultDialog(
                        content: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextField(
                                autofocus: true,
                                controller: controller.todoTitle,
                              ),
                              TextField(
                                controller: controller.todoDes,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GetBuilder<TodoController>(
                                  builder: (controller) => ElevatedButton(
                                      onPressed: controller.isButtonDisabled
                                          ? null
                                          : () {
                                              controller.addTodo(
                                                  controller.currentUser);
                                            },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.primary),
                                      child: controller.isButtonDisabled
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,

                                              // padding: const EdgeInsets.all(22.0),
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2),
                                            )
                                          : const Text(
                                              'Add',
                                              style: TextStyle(
                                                  color: AppColor.white),
                                            )))
                            ],
                          ),
                        ),
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
