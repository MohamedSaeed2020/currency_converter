import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectCurrencyModalItem extends StatelessWidget {
  final int index;
  final Currency currency;
  final VoidCallback selectCurrencyTap;

  const SelectCurrencyModalItem(
      {Key? key,
      required this.index,
      required this.selectCurrencyTap,
      required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectCurrencyTap,
      child: Padding(
        padding: index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
        child: AnimatedContainer(
          curve: Curves.easeInCubic,
          duration: const Duration(milliseconds: 320),
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
              color:  AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              AssetsManager.getMaterialUrl(currency.id)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Flexible(
                      child: Text(
                        currency.currencyName.toString(),
                        style: AppStyles.mainHeadlineColor15spw500Poppins.copyWith(fontSize: 14.sp),
                        key: UniqueKey(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
