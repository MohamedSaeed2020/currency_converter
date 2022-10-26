import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/calculator_converter_field.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/calculator_currency_conversion_box.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/numeric_keyboard/num_keyboard_widget.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/converter_title.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyConverterScreen extends StatelessWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConverterCubit converterCubit = ConverterCubit.get(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5.h,
              ),
              const ConverterTitle(
                title: AppStrings.currencyConverterTitle,
              ),
              SizedBox(
                height: 3.h,
              ),
              const CalculatorConverterField(),
              SizedBox(
                height: 3.h,
              ),
              const CalculatorCurrencyConversionBox(),
              const Spacer(),
              NumKeyboardWidget(
                converterCubit: converterCubit,
              ),
            ]),
      ),
    );
  }
}
