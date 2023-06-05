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
                Container(
                  width: 120.sw,
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(62, 167, 11, 214),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(
                        text: "Demo text",
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 105, 105, 105),
                      ),
                      const RegularText(text: "Demo Des"),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: const Color.fromARGB(164, 169, 24, 226),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 35.w,
                            height: 35.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: const Color.fromARGB(164, 169, 24, 226),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                                                  controller.uuid,
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
                                          : const Text('Add')))
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
                GetBuilder<TodoController>(
                    builder: (controller) => Text(controller.demo.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
