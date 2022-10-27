import 'package:calculator_converter/Config/styles.dart';
import 'package:flutter/material.dart';

class CurrencyHistoryItemValues extends StatelessWidget {
  final String? fromCurrencyCode;
  final String? toCurrencyCode;

  const CurrencyHistoryItemValues(
      {Key? key, required this.fromCurrencyCode, required this.toCurrencyCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: fromCurrencyCode,
                style: AppStyles.mainHeadlineColor14spw700NotoSans),
            TextSpan(
                text: ' / ', style: AppStyles.mainGrayColor14spw700NotoSans),
            TextSpan(
                text: toCurrencyCode,
                style: AppStyles.mainHeadlineColor14spw700NotoSans),
          ]),
        ),
      ],
    );
  }
}
