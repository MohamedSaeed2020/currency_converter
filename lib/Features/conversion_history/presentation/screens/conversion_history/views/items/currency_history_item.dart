import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history_data.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/views/items/currency_history_item_conversion_values.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/views/items/currency_history_item_date.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/views/items/currency_history_item_stacked_flags.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/views/items/currency_history_item_valutes.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryItem extends StatelessWidget {
  final List<String> conversionHistoryDate;
  final List<num> conversionHistoryValues;
  final int index;

  const CurrencyHistoryItem({
    Key? key,
    required this.conversionHistoryDate,
    required this.index, required this.conversionHistoryValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConverterCubit converterCubit = ConverterCubit.get(context);
    return SingleChildScrollView(
      child: Container(
        color: AppColors.whiteColor,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CurrencyHistoryItemStackedFlags(
                fromCurrencyCode: converterCubit.fromConversionValue.id,
                toCurrencyCode: converterCubit.toConversionValue.id,
              ),
              CurrencyHistoryItemDate(
                date: conversionHistoryDate[index],
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          CurrencyHistoryItemValues(
            fromCurrencyCode: converterCubit.fromConversionValue.currencyId,
            toCurrencyCode: converterCubit.toConversionValue.currencyId,
          ),
          SizedBox(
            height: 2.h,
          ),
          CurrencyHistoryItemConversionValues(
            conversionValue: conversionHistoryValues[index],
            fromCurrencyCode: converterCubit.fromConversionValue.currencyId,
            toCurrencyCode: converterCubit.toConversionValue.currencyId,
          ),
        ]),
      ),
    );
  }
}
