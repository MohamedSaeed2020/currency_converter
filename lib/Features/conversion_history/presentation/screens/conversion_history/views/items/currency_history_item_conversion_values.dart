import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Cores/Helpers/extensions/format_extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryItemConversionValues extends StatelessWidget {
  final num conversionValue;
  final String fromCurrencyCode;
  final String toCurrencyCode;
  const CurrencyHistoryItemConversionValues({Key? key, required this.conversionValue, required this.fromCurrencyCode, required this.toCurrencyCode,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: fromCurrencyCode,
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
              TextSpan(
                  text: ' 1',
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
            ]),
          ),
        ),
        Icon(
          Icons.arrow_right_alt_rounded,
          size: 8.w,
        ),
        Flexible(
          flex: 0,
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: toCurrencyCode,
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
              TextSpan(
                  text: ' ${(conversionValue).makeFormattedWithComma} ',
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
            ]),
          ),
        )
      ],
    );
  }
}
