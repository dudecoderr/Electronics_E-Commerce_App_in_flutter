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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 40.h),
                child: CommonButton(
                    onTap: () {
                      print("fdngrn  b ");
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 12.sp)),
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(children: [
                            Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: kDarkYellow,
                                borderRadius: BorderRadius.circular(35.h),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.note_add, size: 16.sp, color: kTextColor),
                                    SizedBox(height: 4.h),
                                    CustomText('Free delivery', fontWeight: FontWeight.w500, fontSize: 13.sp)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: kDarkYellow,
                                borderRadius: BorderRadius.circular(35.h),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.redo, size: 18.sp, color: kTextColor),
                                    SizedBox(height: 4.h),
                                    CustomText('Free returns', fontWeight: FontWeight.w500, fontSize: 13.sp)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              // height: 210.h,
                              padding: EdgeInsets.all(15.h),
                              decoration: BoxDecoration(
                                color: const Color(0xff94c2a3),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(27.r),
                                  bottomLeft: Radius.circular(27.r),
                                  bottomRight: Radius.circular(27.r),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.star_rounded, color: kTextColor, size: 32.sp),
                                    SizedBox(height: 3.h),
                                    CustomText('4.8', fontSize: 16.sp, fontWeight: FontWeight.w700),
                                    SizedBox(height: 4.h),
                                    CustomText('120 Reviews', fontSize: 11.sp, fontWeight: FontWeight.w500),
                                    SizedBox(height: 8.h),
                                    CustomText(
                                      'The aluminum case is lightweight and made from 100 percent recycled aerospace-grade alloy. The Sport Loop is made from a soft and breathable double-...',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                            child: Column(children: [
                          Container(
                            // height: 200.h,
                            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: const Color(0xfff6e39e),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(27.r),
                                bottomLeft: Radius.circular(27.r),
                                bottomRight: Radius.circular(27.r),
                              ),
                            ),
                            child: CustomText(
                              'The aluminum case is lightweight and made from 100 percent recycled aerospace-grade alloy. The Sport Loop is made from a soft and breathable double-...',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            // height: 200.h,
                            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(27.r),
                                topRight: Radius.circular(27.r),
                                bottomRight: Radius.circular(27.r),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.network_check, size: 15.sp, color: kTextColor),
                                      SizedBox(width: 15.w),
                                      CustomText(
                                        'cellular \navailable',
                                        color: kTextColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      Icon(Icons.redo, size: 15.sp, color: kTextColor),
                                      SizedBox(width: 15.w),
                                      CustomText(
                                        'cellular \navailable',
                                        color: kTextColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      Icon(Icons.network_check, size: 15.sp, color: kTextColor),
                                      SizedBox(width: 15.w),
                                      CustomText(
                                        'cellular \navailable',
                                        color: kTextColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      Icon(Icons.network_check, size: 15.sp, color: kTextColor),
                                      SizedBox(width: 15.w),
                                      CustomText(
                                        'cellular \navailable',
                                        color: kTextColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25.w,
            left: MediaQuery.of(context).size.width / 2 - 55.w,
            right: MediaQuery.of(context).size.width / 2 - 55.w,
            child: Container(
              height: 50.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: kDarkYellow,
                borderRadius: BorderRadius.circular(35.h),
              ),
              child: Center(
                child: Icon(Icons.shopping_cart_outlined, size: 22.sp, color: kTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
