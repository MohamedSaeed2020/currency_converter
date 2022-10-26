import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CalculatorExchangeButton extends StatelessWidget {
  const CalculatorExchangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConverterCubit converterCubit = ConverterCubit.get(context);

    return GestureDetector(
      onTap: converterCubit.exchangeCurrencyConversions,
      child: Container(
        width: 6.w,
        height: 6.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            AssetsManager.swapIcon,
          ),
        )),
      ),
    );
  }
}
