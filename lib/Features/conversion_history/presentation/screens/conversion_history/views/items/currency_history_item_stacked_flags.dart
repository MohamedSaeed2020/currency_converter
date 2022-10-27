import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryItemStackedFlags extends StatelessWidget {
  final String? fromCurrencyCode;
  final String? toCurrencyCode;

  const CurrencyHistoryItemStackedFlags(
      {Key? key, required this.fromCurrencyCode, required this.toCurrencyCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      clipBehavior: Clip.none,
      children: [
        buildStackedFlag(fromCurrencyCode),
        Positioned(
          left: 6.w,
          child: buildStackedFlag(toCurrencyCode),
        )
      ],
    );
  }

  Container buildStackedFlag(String? fromCurrencyCodeString) {
    return Container(
      width: 9.w,
      height: 9.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
                AssetsManager.getMaterialUrl(fromCurrencyCodeString)),
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
