import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:electronics_e_commerce_app/constant/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/common_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _AppointmentConpleteScreenState();
}

class _AppointmentConpleteScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  bool isComplete = false;
  bool animate = false;

  double opacity = 0.2;
  double buttonW = 0;
  double buttonH = 0;

  buttonOpacity() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      opacity = 1;
    });
  }

  startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      animate = true;
      buttonW = 330.w;
      buttonH = 50.h;
    });
  }

  @override
  void initState() {
    buttonOpacity();
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightYellow,
      body: Stack(
        // alignment: Alignment.topRight,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 40.h),
                child: CommonButton(child: Icon(Icons.arrow_back_ios, size: 12.sp)),
              ),
              Container(
                height: 300.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: kDarkYellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(210.r),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 250.w,
                        child: Column(
                          children: [
                            CustomText('Apple watch series 8', fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16.sp),
                            CustomText(
                              '\$16.62/mo',
                              fontSize: 24.sp,
                              fontFamily: 'Roboto_Bold',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Transform.rotate(
                      angle: 0.3,
                      child: Image.asset(
                        'assets/images/watch-black.png',
                        height: 270.h,
                        fit: BoxFit.fill,
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Column(children: [
                          Container(
                            height: 60.h,
                            color: kDarkYellow,
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 60.h,
                            color: kDarkYellow,
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 130.h,
                            color: kLightGreen,
                          )
                        ]),
                      ),
                      Expanded(child: Column(children: [])),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
