import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/utils/app_color.dart';
import 'package:todoapp/views/product_details.dart';
import '../controllers/application_controller.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColorOne,
      body: SafeArea(
          child: GetBuilder<ApplicationController>(
        builder: (controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: InkWell(
                      child: SizedBox(
                        width: 300.sw,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(15.w),
                            child: Text(
                              controller.products[index]['title']
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Get.to(ProductDetails(index: index));
                      },
                    ),
                  );
                }),
      )),
    );
  }
}
