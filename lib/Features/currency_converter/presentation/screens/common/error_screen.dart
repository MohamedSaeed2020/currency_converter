import 'package:animate_do/animate_do.dart';
import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInUp(
              child: Center(
                child: Container(
                  width: 70.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: Svg(AssetsManager.errorIcon),
                    fit: BoxFit.fitWidth,
                  )),
                ),
              ),
            ),
            Text(
              'Error!',
              style: AppStyles.mainHeadlineColorW70020spPoppins,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                AppStrings.errorScreenMessage,
                style: AppStyles.mainGrayColorW70013spPoppinsLineHeight,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
              onTap: () {
                _retryTap(context);
              },
              child: Container(
                width: double.infinity,
                height: 7.h,
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: AppStyles
                    .mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle,
                child: Material(
                  color: AppColors.transparentColor,
                  child: Center(
                    child: Text(
                      AppStrings.errorScreenRetryButtonTitle,
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
    );
  }

  void _retryTap(BuildContext context) {
    ConverterCubit.get(context).onInit();
  }
}
