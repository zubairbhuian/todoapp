import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/utils/app_color.dart';

void customSnackbar({String? msg, Color? color, ToastGravity? gravity}) {
  Fluttertoast.showToast(
      backgroundColor: color ?? AppColor.primary,
      gravity: gravity ?? ToastGravity.TOP,
      msg: msg ?? 'This service will be available very soon');
}
