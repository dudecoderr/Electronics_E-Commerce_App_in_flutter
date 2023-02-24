import 'package:electronics_e_commerce_app/constant/common_button.dart';
import 'package:electronics_e_commerce_app/constant/constant.dart';
import 'package:electronics_e_commerce_app/screens/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationTab extends StatefulWidget {
  const BottomNavigationTab({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTab> createState() => _BottomNavigationTabState();
}

class _BottomNavigationTabState extends State<BottomNavigationTab> {
  int currentIndex = 0;
  List screens = const [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent.withOpacity(0.0),
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: '', activeIcon: CommonButton(height: 45.h, width: 55.w, child: const Icon(Icons.home_filled))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.grid_view),
                label: '',
                activeIcon: CommonButton(height: 45.h, width: 55.w, child: const Icon(Icons.grid_view_rounded))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: '', activeIcon: CommonButton(height: 45.h, width: 55.w, child: const Icon(Icons.search))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border_rounded),
                label: '',
                activeIcon: CommonButton(height: 45.h, width: 55.w, child: const Icon(Icons.favorite_rounded))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                label: '',
                activeIcon: CommonButton(height: 45.h, width: 55.w, child: const Icon(Icons.person))),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedItemColor: kTextColor,
          backgroundColor: kLightYellow,
          selectedItemColor: kWhiteColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 24.sp,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          elevation: 23,
        ),
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
