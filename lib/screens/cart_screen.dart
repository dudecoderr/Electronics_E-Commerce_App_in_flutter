import 'dart:async';

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late Timer timer;
  Duration duration = const Duration();
  Duration countdownDuration = const Duration();

  double opacity = 0.0;
  String seconds = '0';
  String minutes = '0';
  String hours = '0';
  var time;

  @override
  void initState() {
    startCall();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future startCall() async {}

  animationOpacity() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      opacity = 1;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const addSeconds = 1;
      setState(() {
        final seconds = duration.inSeconds + addSeconds;
        if (seconds < 0) {
          timer.cancel();
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - animationController!.value;
    return Scaffold();
  }
}
