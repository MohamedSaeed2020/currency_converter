import 'package:calculator_converter/Config/styles.dart';
import 'package:flutter/material.dart';

class CurrencyHistoryTitle extends StatelessWidget {
  final String title;

  const CurrencyHistoryTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.mainHeadlineColorW70020spPoppins,
      textAlign: TextAlign.center,
    );
  }
}
