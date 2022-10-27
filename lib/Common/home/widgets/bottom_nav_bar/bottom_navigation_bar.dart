import 'package:calculator_converter/Common/home/widgets/bottom_nav_bar/bottom_bar_item.dart';
import 'package:calculator_converter/Config/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            BottomBarItem(icon: Icons.calculate, index: 0),
            BottomBarItem(icon: Icons.history, index: 1),
          ],
        ),
      ),
    );
  }
}
