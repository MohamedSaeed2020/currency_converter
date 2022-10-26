import 'package:animate_do/animate_do.dart';
import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class ExceedInputLimitInfoDialog extends StatelessWidget {
  const ExceedInputLimitInfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Column(
              children: <Widget>[
                FadeInDown(
                  child: Container(
                    width: 70.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: Svg(AssetsManager.notifyIcon),
                      fit: BoxFit.fitWidth,
                    )),
                  ),
                ),
                Text(
                  AppStrings.exceedInputLimitInfoTitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.mainHeadlineColorW70017spPoppins,
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () => _comeBack(context),
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    decoration: AppStyles
                        .mainBlueColorExceedInputDialogButtonBoxDecorationStyle,
                    child: Material(
                      color: AppColors.transparentColor,
                      child: Center(
                        child: Text(
                          AppStrings.exceedInputLimitInfoButtonTitle,
                          textAlign: TextAlign.center,
                          style: AppStyles.whiteColor15spw700NotoSans,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _comeBack(context) => Navigator.pop(context, true);
}
