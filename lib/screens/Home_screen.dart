import 'package:electronics_e_commerce_app/constant/common_button.dart';
import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:electronics_e_commerce_app/constant/text_widget.dart';
import 'package:electronics_e_commerce_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool animate = false;
  bool visible = false;
  bool doctorName = false;
  bool tapAppointment = false;
  bool getAppointment = false;

  double opacityFirst = 0.1;
  double opacity = 0.1;
  double doctorWidth = 0;
  double doctorHeight = 0;
  double calenderWidth = 0;
  double appointmentW = 0;
  double appointmentH = 0;
  double medicineTimeW = 0;
  double height = 0.h;
  double listViewHeight = 0.h;
  double testH = 0.h;
  double medicineImageW = 0.h;
  double medicineImageH = 0.h;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      opacity = 1;
      height = 150.h;
      opacityFirst = 1;
      listViewHeight = 150.h;
      testH = 73.h;
    });
  }

  Future doctorProfileAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      doctorName = true;
      doctorWidth = 70.h;
      doctorHeight = 70.h;
      calenderWidth = 300.h;
      medicineTimeW = 115.w;
      medicineImageW = 45.h;
      medicineImageH = 45.h;
    });
  }

  List companyName = ['All', 'Apple', 'Samsung', 'HuaWei', 'Google'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightYellow,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              top: animate ? 15.h : 40.h,
              duration: const Duration(milliseconds: 600),
              child: Container(
                width: 330.w,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(child: Icon(Icons.filter_list, color: kWhiteColor, size: 22.sp)),
                    // Spacer(),
                    CustomText('Gadget', fontSize: 18.sp, fontWeight: FontWeight.w700),
                    // Spacer(),
                    CommonButton(child: Icon(Icons.card_travel, size: 20.sp, color: kWhiteColor)),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              top: animate ? 70.h : 80.h,
              duration: const Duration(milliseconds: 600),
              child: Container(
                width: 330.w,
                height: 150.h,
                margin: EdgeInsets.only(right: 17.w, left: 20.w),
                child: SvgPicture.asset(
                  'assets/images/home_banner.svg',
                  width: 310.w,
                  height: 150.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            AnimatedPositioned(
              top: animate ? 60.h : 130.h,
              // right: animate ? 15.w : -315.w,
              duration: const Duration(milliseconds: 800),
              child: AnimatedOpacity(
                opacity: opacity,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 700),
                child: Container(
                  width: 325.w,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText('50% Off', fontSize: 40.sp, fontFamily: 'Roboto_Medium', fontWeight: FontWeight.w900),
                            CustomText('unbelievable visual & \nperformance', fontSize: 13.sp, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                            Container(
                              height: 50.h,
                              width: 90.w,
                              margin: EdgeInsets.only(left: 85.w),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: kTextColor, width: 1.r),
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Center(child: CustomText('Buy Now', fontSize: 12.sp, fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                          margin: EdgeInsets.only(bottom: 15.w),
                          child: Image.asset(
                            'assets/images/headphone.png',
                            height: 140.h,
                            width: 120.w,
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: animate ? 230.h : 260.h,
              left: 20.w,
              // right: animate ? 15.w : -315.w,
              duration: const Duration(milliseconds: 600),
              child: AnimatedOpacity(
                opacity: opacity,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 700),
                child: SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                      itemCount: companyName.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(right: 18.w),
                            child: CommonButton(
                                height: 35.h,
                                width: 45.h,
                                child: CustomText(companyName[index], fontWeight: FontWeight.w600, color: kWhiteColor, fontSize: 13.sp)),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(top: 6.h, right: 18.w),
                            child: CustomText(
                              companyName[index],
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                      }),
                ),
              ),
            ),
            AnimatedPositioned(
              top: animate ? 280.h : 420.h,
              duration: const Duration(milliseconds: 600),
              child: AnimatedOpacity(
                opacity: opacity,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 700),
                child: SizedBox(
                  height: 160.h,
                  width: 360.w,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          for (int index = 0; index < gadgetList.length; index++)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            gadgetDetail: gadgetList[index],
                                          )),
                                );
                              },
                              child: Container(
                                height: 160.h,
                                width: 145.w,
                                margin: EdgeInsets.only(right: 10.w, left: index == 0 ? 15.w : 0),
                                padding: EdgeInsets.all(13.r),
                                decoration: BoxDecoration(
                                  color: gadgetList[index].color,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(index % 2 == 0 ? 0.r : 22.r),
                                    topRight: Radius.circular(22.r),
                                    bottomLeft: Radius.circular(22.r),
                                    bottomRight: Radius.circular(index % 2 != 0 ? 0.r : 22.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'assets/images/${gadgetList[index].image}',
                                      child: Image.asset(
                                        'assets/images/${gadgetList[index].image}',
                                        height: 85.h,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        CustomText(gadgetList[index].name!, fontWeight: FontWeight.w400, fontSize: 10.sp),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Icon(Icons.star_rounded, size: 15.sp, color: kTextColor),
                                            CustomText(' 4.8', fontWeight: FontWeight.w500, fontSize: 11.sp)
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        CustomText('\$${gadgetList[index].price}', fontWeight: FontWeight.w600, fontSize: 12.sp),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Icon(Icons.favorite, size: 14.sp, color: kTextColor),
                                            CustomText(' 86%', fontWeight: FontWeight.w500, fontSize: 11.sp)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      )),
                ),
              ),
            ),
            AnimatedPositioned(
              top: animate ? 460.h : 480.h,
              left: 20.w,
              duration: const Duration(milliseconds: 600),
              child: AnimatedOpacity(
                  opacity: opacity,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
                  child: CustomText('Recommended', fontWeight: FontWeight.w700, fontSize: 18.sp)),
            ),
            AnimatedPositioned(
                top: animate ? 500.h : 650.h,
                duration: const Duration(milliseconds: 600),
                child: AnimatedOpacity(
                  opacity: opacity,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 600),
                  child: SizedBox(
                    height: 140.h,
                    width: 360.w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          for (int i = 0; i < gadgetList.length; i++)
                            Container(
                              height: 140.h,
                              width: 300.w,
                              margin: EdgeInsets.only(right: 10.w, left: i == 0 ? 15.w : 0),
                              padding: EdgeInsets.all(14.r),
                              decoration: BoxDecoration(
                                color: gadgetColor[i]['color'],
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 140.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      color: gadgetColor[i]['imageColor'],
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Image.asset(
                                      'assets/images/${gadgetList[i].image}',
                                      height: 85.h,
                                    ),
                                  ),
                                  SizedBox(width: 10.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.h),
                                      CustomText(gadgetList[i].name!, fontFamily: 'Roboto_Medium', fontWeight: FontWeight.w500, fontSize: 13.sp),
                                      SizedBox(height: 5.h),
                                      CustomText("\$16.62/mo", fontFamily: 'Roboto_Bold', fontWeight: FontWeight.w700, fontSize: 19.sp),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.star_rounded, size: 15.sp, color: kTextColor),
                                              CustomText(' 4.8', fontWeight: FontWeight.w500, fontSize: 11.sp)
                                            ],
                                          ),
                                          SizedBox(width: 10.w),
                                          Row(
                                            children: [
                                              Icon(Icons.favorite, size: 14.sp, color: kTextColor),
                                              CustomText(' 86%', fontWeight: FontWeight.w500, fontSize: 11.sp)
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Icon(Icons.note_add, size: 15.sp, color: kTextColor),
                                          CustomText(' Free delivery', fontWeight: FontWeight.w500, fontSize: 12.sp)
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      Row(
                                        children: [
                                          Icon(Icons.redo, size: 15.sp, color: kTextColor),
                                          CustomText(' Free returns', fontWeight: FontWeight.w500, fontSize: 12.sp)
                                        ],
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 5.h),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
