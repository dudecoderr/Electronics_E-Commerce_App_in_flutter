import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        alignment: Alignment.topRight,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 300.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: kDarkYellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(180.r),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
