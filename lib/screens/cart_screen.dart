import 'dart:async';

import 'package:electronics_e_commerce_app/constant/common_button.dart';
import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:electronics_e_commerce_app/constant/text_widget.dart';
import 'package:electronics_e_commerce_app/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {
  double opacity = 0.0;

  bool animate = false;
  double cartTotalHeight = 0.0;
  double buttonHeight = 0.0;
  double padding = 0.0;
  Color color = Colors.transparent;
  int counter = 1;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    setState(() {
      padding = 120.h;
      color = kDarkYellow;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      animate = true;
    });
  }

  animationOpacity() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightYellow,
      appBar: AppBar(
        backgroundColor: kLightYellow,
        elevation: 0,
        leading: CommonButton(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: kTextColor, size: 12.sp)),
        centerTitle: true,
        title: CustomText('Cart', fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: padding),
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Container(
                          height: 100.h,
                          color: Colors.transparent,
                          margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 15.h),
                          // padding: EdgeInsets.only(top: 490.h, bottom: 15.h, left: 20.h, right: 20.h),
                          child: Row(
                            children: [
                              Hero(
                                tag: cartList[index + 1].image!,
                                child: Container(
                                  height: 100.h,
                                  width: 100.h,
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(color: cartList[index + 1].color, borderRadius: BorderRadius.circular(20.h)),
                                  child: Image.asset(cartList[index + 1].image!),
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '\$${cartList[index + 1].price}',
                                      style: TextStyle(fontWeight: FontWeight.w700, color: kTextColor, fontSize: 18.sp),
                                      children: [
                                        TextSpan(
                                          text: ' \$120.00',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.lineThrough,
                                              fontSize: 12.sp,
                                              color: kDarkYellow),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomText(cartList[index + 1].name!, fontSize: 13.sp, fontWeight: FontWeight.w300),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (counter > 0) {
                                            setState(() {
                                              counter--;
                                            });
                                          }

                                          print("counter-- :: ${counter}");
                                        },
                                        child: CircleAvatar(
                                          radius: 16.r,
                                          backgroundColor: kYellow,
                                          child: Icon(Icons.delete_outline, size: 18.sp, color: kTextColor),
                                        ),
                                      ),
                                      Container(
                                        width: 35.w,
                                        alignment: Alignment.center,
                                        child: CustomText(
                                          counter.toString(),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            counter++;
                                          });
                                          print("counter :: ${counter}");
                                        },
                                        child: CircleAvatar(
                                          radius: 16.r,
                                          backgroundColor: kYellow,
                                          child: Icon(Icons.add, size: 18.sp, color: kTextColor),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomText(
                                        'Save for later',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          padding != 0.0
              ? Container(
                  height: 120.h,
                  color: color,
                )
              : const SizedBox(),
          padding != 0.0
              ? AnimatedPositioned(
                  right: animate ? 0 : -360.w,
                  duration: const Duration(milliseconds: 800),
                  onEnd: () {
                    setState(() {
                      color = Colors.transparent;
                    });
                  },
                  child: SizedBox(
                    width: 360.w,
                    child: Container(
                      height: 100.h,
                      margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 10.h, bottom: 10.h),
                      child: Row(
                        children: [
                          Hero(
                            tag: cartList[0].image!,
                            child: Container(
                              height: 100.h,
                              width: 100.h,
                              decoration: BoxDecoration(color: cartList[0].color!, borderRadius: BorderRadius.circular(20.h)),
                              child: Image.asset(cartList[0].image!),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '\$${cartList[0].price!}',
                                  style: TextStyle(fontWeight: FontWeight.w700, color: kTextColor, fontSize: 18.sp),
                                  children: [
                                    TextSpan(
                                      text: ' \$120.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough, fontSize: 12.sp, color: kDarkYellow),
                                    ),
                                  ],
                                ),
                              ),
                              CustomText(cartList[0].name!, fontSize: 13.sp, fontWeight: FontWeight.w300),
                              Row(children: [
                                CircleAvatar(
                                  radius: 16.r,
                                  backgroundColor: kYellow,
                                  child: Icon(Icons.delete_outline, size: 18.sp, color: kTextColor),
                                ),
                                Container(
                                  width: 34.w,
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    '1',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 16.r,
                                  backgroundColor: kYellow,
                                  child: Icon(Icons.add, size: 18.sp, color: kTextColor),
                                ),
                                SizedBox(width: 10.w),
                                CustomText(
                                  'Save for later',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ])
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: EdgeInsets.only(top: 490.h, bottom: 15.h, left: 20.h, right: 20.h),
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Column(
                          children: [
                            Container(
                              height: 75.h,
                              // duration: const Duration(seconds: 1),
                              decoration: BoxDecoration(
                                color: kYellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18.r),
                                  topRight: Radius.circular(18.r),
                                  bottomRight: Radius.circular(18.r),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 25.h),
                              // margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 15.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText('Total to pay', fontSize: 14.sp, fontWeight: FontWeight.w500),
                                  CustomText('\$400', fontSize: 14.sp, fontWeight: FontWeight.w700),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: () {
                                print("On Tap order");
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration: Duration(milliseconds: 1200), pageBuilder: (_, __, ___) => OrderDetailScreen()));
                              },
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: kDarkYellow,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 25.h),
                                // margin: EdgeInsets.symmetric(horizontal: 20.h),
                                child: Center(
                                  child: CustomText('Place order', fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
