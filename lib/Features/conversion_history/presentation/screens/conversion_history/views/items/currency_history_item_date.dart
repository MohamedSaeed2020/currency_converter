import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryItemDate extends StatelessWidget {
  final String? date;

  const CurrencyHistoryItemDate({Key? key, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
      decoration: BoxDecoration(
        color: AppColors.mainGreenColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Center(
          child: Text(
        date.toString(),
        textAlign: TextAlign.center,
        style: AppStyles.whiteColor10spw700NotoSans,
      )),
    );
  }
}
