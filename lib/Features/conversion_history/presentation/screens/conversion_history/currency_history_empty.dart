import 'package:animate_do/animate_do.dart';
import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryEmpty extends StatelessWidget {
  const CurrencyHistoryEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeInLeft(
            child: Container(
              width: 60.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: Svg(AssetsManager.noDataIcon),
                fit: BoxFit.fitWidth,
              )),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text(
              AppStrings.currencyHistoryNoDataTitle,
              textAlign: TextAlign.center,
              style: AppStyles.mainHeadlineColorW70020spPoppins.copyWith(
                fontSize: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
