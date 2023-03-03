import 'package:electronics_e_commerce_app/screens/Home_screen.dart';
import 'package:flutter/material.dart';

const Color kDarkYellow = Color(0xFFffde6a);
const Color kYellow = Color(0xFFfaebbc);
const Color kLightYellow = Color(0xfffcf4d3);

const Color kTextColor = Color(0xff525150);

const Color kLightOrange = Color(0xFFf7d49e);
const Color kOrange = Color(0xFFfeb394);
const Color kLightGreen = Color(0xFFa8d4b5);
const Color kLightBlue = Color(0xFF89b9f0);

const Color kWhiteColor = Color(0xFFFFFFFF);

List<GadgetDetail> cartList = [
  GadgetDetail(name: 'Smart watch', price: '120.00', color: kLightGreen, image: 'assets/images/watch-black.png'),
  GadgetDetail(name: 'Air pods', price: '150.00', color: kLightOrange, image: 'assets/images/airpods.png'),
  GadgetDetail(name: 'Earphone', price: '60.00', color: kOrange, image: 'assets/images/earphone.png'),
];
