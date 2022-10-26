import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Config/styles.dart';
import 'package:calculator_converter/Cores/Helpers/extensions/format_extensions.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CalculatorCurrencyConversionBox extends StatelessWidget {
  const CalculatorCurrencyConversionBox({super.key});

  @override
  Widget build(BuildContext context) {
    ConverterCubit converterCubit = ConverterCubit.get(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 88.w,
          decoration: BoxDecoration(
            color: AppColors.mainBackgroundColor,
            borderRadius: BorderRadius.circular(5.w),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
          child: Column(
            children: <Widget>[
              StreamBuilder<double>(
                  stream: converterCubit.typedConversionStream,
                  initialData: 0.0,
                  builder: (context, typedValueSnapshot) {
                    return StreamBuilder<double>(
                        stream: converterCubit.conversionStream,
                        initialData: 0.0,
                        builder: (context, conversionValueSnapshot) {
                          return StreamBuilder<Currency>(
                            stream: converterCubit.fromConversionStream,
                            builder: (context, snapshot) {
                              return StreamBuilder<Currency>(
                                stream: converterCubit.toConversionStream,
                                builder: (context, snapshot) {
                                  return AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 150),
                                      transitionBuilder:
                                          (Widget child, Animation<double> animation) =>
                                              ScaleTransition(
                                                scale: animation,
                                                child: child,
                                              ),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${(typedValueSnapshot.data ?? 0).makeFormattedWithSpace} ',
                                              style: AppStyles
                                                  .mainHeadlineColor14spw700NotoSansLineHeight),
                                          TextSpan(
                                              text: '${converterCubit.fromConversionValue.currencyId} = ',
                                              style: AppStyles
                                                  .mainHeadlineColor14spw700NotoSansLineHeight),
                                          TextSpan(
                                            text:
                                            '${(conversionValueSnapshot.data ?? 0).makeFormattedWithSpace} ',                                    style: AppStyles
                                                .mainHeadlineColor14spw700NotoSansLineHeight,
                                          ),
                                          TextSpan(
                                            text: converterCubit.toConversionValue.currencyId,
                                            style: AppStyles
                                                .mainHeadlineColor14spw700NotoSansLineHeight,
                                          ),
                                        ]),
                                        key: UniqueKey(),
                                      ));
                                }
                              );
                            }
                          );
                        });
                  }),
              SizedBox(
                height: 1.h,
              ),
              Center(
                  child: Text(
                converterCubit.formattedDate,
                textAlign: TextAlign.center,
                style: AppStyles.greyColor11spw700Poppins,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
