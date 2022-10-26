import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final bool deviceTablet = SizerUtil.deviceType == DeviceType.tablet;

abstract class AppStyles {
  static final mainHeadlineColorW70020spPoppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
  );

  static final mainHeadlineColor14spw700NotoSans = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: notoSansFontFamily,
  );

  static final greyColor11spw700Poppins = TextStyle(
    color: AppColors.greyColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
  );

  static final mainHeadlineColor14spw700NotoSansLineHeight = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: notoSansFontFamily,
    height: 1.5,
  );

  static final mainHeadlineColor15spw500Poppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
  static final mainHeadlineColorW70017spPoppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
  );

  static final mainGrayColorW70013spPoppinsLineHeight = TextStyle(
    color: AppColors.greyColor,
    fontWeight: FontWeight.w700,
    fontSize: 13.sp,
    height: 1.5,
  );
  static final whiteColor15spw700NotoSans = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    fontFamily: notoSansFontFamily,
  );

  static final fromCurrencyBoxDecorationStyle = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(6.w),
    border: Border.all(color: AppColors.blueGrayColor, width: 0.5.w),
  );

  static const activeDigitButtonBoxDecorationStyle = BoxDecoration(
    color: AppColors.mainBlueColor,
    shape: BoxShape.circle,
  );
  static final disabledDigitButtonBoxDecorationStyle = BoxDecoration(
    color: AppColors.whiteColor,
    shape: BoxShape.circle,
    boxShadow: [mainDigitBoxShadowStyle],
  );

  static final mainDigitBoxShadowStyle = BoxShadow(
    color: AppColors.mainBlueColor.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );

  static final mainBlueColorExceedInputDialogButtonBoxDecorationStyle =
      BoxDecoration(
    borderRadius: BorderRadius.circular(10.w),
    color: AppColors.mainBlueColor,
  );

  static final mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle =
      BoxDecoration(
    borderRadius: BorderRadius.circular(15.w),
    color: AppColors.mainBlueColor,
  );

  ///***********  History Screen Styles  *****************//

  static final whiteColor10spw700NotoSans = TextStyle(
      color: AppColors.whiteColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 10.sp);

  static final mainHeadlineColor14spw700Poppins = TextStyle(
      color: AppColors.mainHeadlineBlackColor,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final mainGrayColor14spw700NotoSans = TextStyle(
      color: AppColors.greyColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);
}
