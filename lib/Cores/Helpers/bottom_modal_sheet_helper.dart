import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/bottom_modals/select_currency_modal.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void showFromCurrencyBottomModal(
  context, {
  required bool toConversionBoolean,
}) {
  showModalBottomSheet(
    backgroundColor: AppColors.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.w),
        topRight: Radius.circular(10.w),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SelectCurrencyModal(
        toConversion: toConversionBoolean,
      );
    },
  );
}
