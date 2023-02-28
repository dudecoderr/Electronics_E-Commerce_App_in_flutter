import 'package:electronics_e_commerce_app/constant/common_button.dart';
import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:electronics_e_commerce_app/constant/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              print("fdngrn  b ");
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: kTextColor, size: 12.sp)),
        centerTitle: true,
        title: CustomText('Cart', fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
      body: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100.h,
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              children: [
                Container(
                  height: 100.h,
                  width: 100.h,
                  decoration: BoxDecoration(color: kLightGreen, borderRadius: BorderRadius.circular(20.h)),
                  child: Image.asset('assets/images/watch-black.png'),
                ),
                SizedBox(width: 15.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '\$100.00',
                        style: TextStyle(fontWeight: FontWeight.w700, color: kTextColor, fontSize: 18.sp),
                        children: [
                          TextSpan(
                            text: ' \$120.00',
                            style:
                                TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough, fontSize: 12.sp, color: kDarkYellow),
                          ),
                        ],
                      ),
                    ),
                    CustomText('Smart watch', fontSize: 13.sp, fontWeight: FontWeight.w300),
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
          Padding(
            padding: EdgeInsets.only(top: 500.h),
            child: Column(
              children: [
                Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: kYellow,
                    borderRadius: BorderRadius.circular(22.h),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText('Total to pay', fontSize: 14.sp, fontWeight: FontWeight.w500),
                      CustomText('\$400', fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: kDarkYellow,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Center(
                    child: CustomText('Place order', fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
