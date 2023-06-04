import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/application_controller.dart';

import '../widgets/custom_text.dart';

class ProductDetails extends GetView<ApplicationController> {
  final int index;
  const ProductDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Data")),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExtraBigText(
              text: controller.products[index]['id'].toString(),
            ),
            SizedBox(
              height: 16.h,
            ),
            BigText(
              text: controller.products[index]['title'].toString(),
            ),
            SizedBox(
              height: 16.h,
            ),
            RegularText(text: controller.products[index]['body'].toString()),
          ],
        ),
      )),
    );
  }
}
