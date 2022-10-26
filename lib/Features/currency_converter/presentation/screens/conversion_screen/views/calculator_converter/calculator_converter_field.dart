import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/calculator_exchange_button.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/calculator_from_currency_box.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/calculator_to_currency_box.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CalculatorConverterField extends StatelessWidget {
  const CalculatorConverterField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          CalculatorFromCurrencyBox(),
          CalculatorExchangeButton(),
          CalculatorToCurrencyBox(),
        ],
      ),
    );
  }
}
