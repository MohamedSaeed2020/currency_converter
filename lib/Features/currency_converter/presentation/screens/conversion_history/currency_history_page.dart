import 'package:calculator_converter/Config/colors.dart';
import 'package:flutter/material.dart';

class CurrencyHistoryScreen extends StatelessWidget {
  const CurrencyHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Text('History Screen'),
      ),
    );
  }
}
