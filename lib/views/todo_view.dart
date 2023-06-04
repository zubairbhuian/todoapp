import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utils/app_color.dart';
import 'package:todoapp/widgets/custom_text.dart';

class TodoView extends StatelessWidget {
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
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
