import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClearAllInputButton extends StatelessWidget {
  final VoidCallback press;
  final bool isTapped;

  const ClearAllInputButton(
      {Key? key, required this.isTapped, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 400),
        decoration: isTapped
            ? AppStyles.activeDigitButtonBoxDecorationStyle
            : AppStyles.disabledDigitButtonBoxDecorationStyle,
        height: 9.h,
        width: 9.h,
        child: Text(
          AppStrings.clearAllInputButtonTitle,
          style: AppStyles.mainHeadlineColor15spw500Poppins.copyWith(
            color: isTapped
                ? AppColors.whiteColor
                : AppColors.mainHeadlineBlackColor,
          ),
        ),
      ),
    );
  }
}
