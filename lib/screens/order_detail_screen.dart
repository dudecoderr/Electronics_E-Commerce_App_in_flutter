import 'package:electronics_e_commerce_app/constant/common_button.dart';
import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:electronics_e_commerce_app/constant/text_widget.dart';
import 'package:electronics_e_commerce_app/screens/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
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
        title: CustomText('Order Details', fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          SizedBox(
            height: 85.h,
            child: ListView.builder(
              itemCount: cartList.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == cartList.length) {
                  return Container(
                    height: 75.h,
                    width: 75.h,
                    padding: EdgeInsets.all(7.r),
                    margin: EdgeInsets.only(left: index == 0 ? 15.w : 0, right: 10.w),
                    decoration: BoxDecoration(color: kYellow, borderRadius: BorderRadius.circular(20.h)),
                    child: Center(child: CustomText('See all', fontSize: 12.sp)),
                  );
                } else {
                  return Hero(
                    tag: cartList[index].image!,
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 1500),
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        builder: (BuildContext context, double value, Widget? child) {
                          return Opacity(
                            opacity: value,
                            child: child,
                          );
                        },
                        child: toHeroContext.widget,
                      );
                    },
                    child: Container(
                      height: 85.h,
                      width: 85.h,
                      padding: EdgeInsets.all(7.r),
                      margin: EdgeInsets.only(left: index == 0 ? 20.w : 0, right: 10.w),
                      decoration: BoxDecoration(
                        color: cartList[index].color!,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(index % 2 == 0 ? 0.r : 20.r),
                          topRight: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(index % 2 != 0 ? 0.r : 20.r),
                        ),
                      ),
                      child: Image.asset(cartList[index].image!),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 535.h,
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: 1,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 2),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: SizedBox(
                          height: 535.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 12.h),
                                child: CustomText(
                                  'Delivery address',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                height: 80.h,
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                padding: EdgeInsets.all(15.r),
                                decoration: BoxDecoration(color: kLightOrange, borderRadius: BorderRadius.circular(20.h)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(15.h)),
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        size: 20.sp,
                                        color: kTextColor,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          '8 Terrell Ave,Staten Island, \nNY 10312,United States...',
                                          fontSize: 13.sp,
                                        ),
                                        CustomText(
                                          'Change',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 36.w,
                                      height: 36.w,
                                      decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(10.h)),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 12.h),
                                child: CustomText(
                                  'Shipping to',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 110.h,
                                child: ListView.builder(
                                  itemCount: cartList.length + 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Container(
                                        width: 50.h,
                                        padding: EdgeInsets.all(7.r),
                                        margin: EdgeInsets.only(left: index == 0 ? 15.w : 0, right: 10.w),
                                        decoration: BoxDecoration(color: kYellow, borderRadius: BorderRadius.circular(15.h)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 27.w,
                                              height: 27.w,
                                              decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(10.h)),
                                              child: Icon(Icons.add, size: 12.sp),
                                            ),
                                            SizedBox(height: 7.h),
                                            CustomText(
                                              'Add',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: 110.h,
                                            width: 200.h,
                                            padding: EdgeInsets.all(15.r),
                                            margin: EdgeInsets.only(left: index == 0 ? 20.w : 0, right: 10.w),
                                            decoration: BoxDecoration(color: cartList[index - 1].color!, borderRadius: BorderRadius.circular(20.h)),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: CustomText(
                                                '02/25',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: index == 0 ? 20.w : 0, right: 10.w),
                                            child: ClipPath(
                                              clipper: ClipPathClass(),
                                              child: Container(
                                                height: 110.h,
                                                width: 130.h,
                                                padding: EdgeInsets.all(12.r),
                                                decoration: BoxDecoration(color: kOrange, borderRadius: BorderRadius.circular(20.h)),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      'VISA',
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    CustomText(
                                                      '246.99',
                                                      fontSize: 24.sp,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    const Spacer(),
                                                    CustomText(
                                                      '**** 0032',
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ],
                                                ),
                                                // child: Image.asset(
                                                //   _imageUrl,
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h, bottom: 20.h),
                                  child: AnimationLimiter(
                                    child: ListView.builder(
                                      itemCount: 1,
                                      physics: const NeverScrollableScrollPhysics(),
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
                                                    height: 130.h,
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
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            CustomText('Sub-total', fontSize: 14.sp, fontWeight: FontWeight.w500),
                                                            CustomText('\$400', fontSize: 14.sp, fontWeight: FontWeight.w700),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            CustomText('Delivery', fontSize: 14.sp, fontWeight: FontWeight.w500),
                                                            CustomText('\$400', fontSize: 14.sp, fontWeight: FontWeight.w700),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            CustomText('Total to pay', fontSize: 14.sp, fontWeight: FontWeight.w500),
                                                            CustomText('\$400', fontSize: 14.sp, fontWeight: FontWeight.w700),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const BottomNavigationTab()),
                                                      );
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

          // SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 00);

    var firstControlPoint = Offset(size.width, size.height / 4);
    var firstPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width, size.height - (size.height / 4));
    var secondPoint = Offset(size.width - 20, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondPoint.dx, secondPoint.dy);

    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
