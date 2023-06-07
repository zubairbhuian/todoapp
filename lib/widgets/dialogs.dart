import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/utils/app_color.dart';

import '../controllers/todo_controller.dart';
import 'custom_text.dart';

permissionDialog(
        {String? title,
        required String msg,
       required VoidCallback? onCancel,
       required VoidCallback? onConfirm}) =>
    Get.defaultDialog(
        title: title ?? 'Alert',
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              RegularText(textAlign: TextAlign.center, text: msg),
              SizedBox(
                height: 10.w,
              ),
              SizedBox(
                width: 120.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed:onCancel,
                        child: const RegularText(
                          text: 'No',
                          color: AppColor.white,
                        )),
                    SizedBox(
                      width: 20.w,
                    ),
                    ElevatedButton(
                        onPressed: onConfirm,
                        child: const RegularText(
                            text: 'Yes', color: AppColor.white)),
                  ],
                ),
              )
            ],
          ),
        ));

todosDialog(
        {String? title,
        required String btnText,
        TextEditingController? todoTitle,
        TextEditingController? todoDes,
        VoidCallback? onPressed}) =>
    Get.defaultDialog(
      title:title?? 'title',
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: todoTitle,
            ),
            TextField(
              controller: todoDes,
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<TodoController>(
                builder: (controller) => ElevatedButton(
                    onPressed: controller.isButtonDisabled
                        ? null
                        :onPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary),
                    child: controller.isButtonDisabled
                        ? const SizedBox(
                            width: 20,
                            height: 20,

                            // padding: const EdgeInsets.all(22.0),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        :  Text(
                            btnText,
                            style: TextStyle(color: AppColor.white),
                          )))
          ],
        ),
      ),
    );
