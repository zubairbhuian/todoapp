import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/widgets/custom_text.dart';

import '../core/utils/app_color.dart';
import 'custom_btn.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(.4),
      child: Center(
        child: Container(
            width: 100.w,
            height: 100.w,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColor.white),
            child: const CircularProgressIndicator()),
      ),
    );
  }
}

class TodosCard extends StatelessWidget {
  final String title;
  final String body;
  final String lastEdit;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const TodosCard(
      {super.key,
      required this.title,
      required this.body,
      required this.lastEdit, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
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
            text: title,
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 105, 105, 105),
          ),
          RegularText(text: body),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegularText(
                text: lastEdit,
                color: Colors.red,
                fontSize: 11.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TodosBtn(icon: Icons.edit, onTap: onEdit),
                  SizedBox(
                    width: 10.w,
                  ),
                  TodosBtn(icon: Icons.delete, onTap: onDelete),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
