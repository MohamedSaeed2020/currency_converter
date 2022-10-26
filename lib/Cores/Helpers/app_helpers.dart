import 'package:calculator_converter/Config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AppHelpers {
  static void makeAppInPortraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  static void makeStatusBarColorTransparent() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
    ));
  }

  static showSnackBar(String message, String status) {
    Get.snackbar(
      status == "error" ? 'Problem' : 'Alarm',
      message,
      icon: const Icon(Icons.notifications, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          status == "error" ? AppColors.lightRed : AppColors.lightGreen,
      borderRadius: 3.w,
      margin: EdgeInsets.all(2.h),
      colorText: AppColors.whiteColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
