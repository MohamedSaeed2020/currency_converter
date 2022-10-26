import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/currency_selection_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/bottom_modals/select_currency_modal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SelectCurrencyModal extends StatelessWidget {
  final bool toConversion;

  const SelectCurrencyModal({
    Key? key,
    required this.toConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Material(
      type: MaterialType.transparency,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 3.h, bottom: 3.h, right: 4.w),
          child: RawScrollbar(
            thumbColor: AppColors.mainBlueColor,
            thickness: 4,
            minThumbLength: 12.h,
            radius:  Radius.circular(3.w),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
              ),
              child: SizedBox(
                height: 50.h,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: BlocBuilder<ConverterCubit, ConverterState>(
                    builder: (context, state) {
                      ConverterCubit converterCubit =
                          ConverterCubit.get(context);
                      return ListView.builder(
                        itemCount: converterCubit.currencies.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var data = converterCubit.currencies[index];
                          return BlocBuilder<CurrencySelectionCubit,
                              CurrencySelectionState>(
                            builder: (context, state) {
                              CurrencySelectionCubit currencySelectionCubit =
                                  CurrencySelectionCubit.get(context);
                              return SelectCurrencyModalItem(
                                index: index,
                                selectCurrencyTap: () {
                                  currencySelectionCubit.selectCurrencyItem(
                                    index,
                                    toConversion,
                                    context,
                                  );
                                },
                                currency: data,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
