import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Cores/Helpers/bottom_modal_sheet_helper.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/dropdown/dropdown_flag_icon.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/dropdown/dropdown_icon.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/calculator_converter/dropdown/dropdown_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CalculatorToCurrencyBox extends StatelessWidget {
  const CalculatorToCurrencyBox({super.key});

  @override
  Widget build(BuildContext context) {
    ConverterCubit converterCubit = ConverterCubit.get(context);

    return StreamBuilder<Currency>(
        stream: converterCubit.toConversionStream,
        initialData: converterCubit.currencies.elementAt(1),
        builder: (context, snapshot) {
          final currency = snapshot.data;

          return GestureDetector(
            onTap: () => _showSelectCurrencyModal(context, currency!.id),
            child: Container(
              decoration: AppStyles.fromCurrencyBoxDecorationStyle,
              padding: EdgeInsets.all(2.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DropdownFlagIcon(currency?.id.toLowerCase()),
                    SizedBox(
                      width: 3.w,
                    ),
                    DropdownText(
                      text: currency?.currencyId,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    const DropdownIcon(),
                  ]),
            ),
          );
        });
  }

  void _showSelectCurrencyModal(context, id) {
    showFromCurrencyBottomModal(
      context,
      toConversionBoolean: true,
    );
  }
}
