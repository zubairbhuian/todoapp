import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final Color? foregroundColor;
  const CustomBtn({
    required this.title,
    required this.onPressed,
    Key? key,
    this.color,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: foregroundColor ?? Colors.white)),
            backgroundColor: color ?? AppColor.primary,
            padding: const EdgeInsets.all(14.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        child: Center(
            child: Text(
          title,
        )));
  }
}
