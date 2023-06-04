import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/routes/app_routes.dart';
import 'package:todoapp/core/utils/app_color.dart';
import 'package:todoapp/widgets/custom_btn.dart';
import '../core/store/config.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(250, 161, 53, 161),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(235, 191, 235, 0.314),
              foregroundColor: AppColor.white,
              radius: 130.r,
              child: Text(
                "ToDo App",
                style: GoogleFonts.lato(
                    fontSize: 30.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: CustomBtn(
                  title: 'Go to singnin',
                  color: const Color.fromARGB(137, 201, 3, 175),
                  onPressed: () {
                    ConfigStore.to.saveAlreadyOpen();
                    Get.offNamed(AppRoutes.SIGN_IN);
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
