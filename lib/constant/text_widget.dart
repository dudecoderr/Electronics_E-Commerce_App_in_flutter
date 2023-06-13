import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const CustomText(this.text,
      {this.color, this.fontSize, this.fontWeight, this.fontFamily, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? kTextColor,
          fontFamily: fontFamily ?? 'Roboto',
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
