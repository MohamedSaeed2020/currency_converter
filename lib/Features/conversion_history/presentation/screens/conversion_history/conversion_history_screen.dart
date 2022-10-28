import 'package:calculator_converter/Common/error_screen.dart';
import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/controllers/conversion_history_cubit.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/currency_history_empty.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/views/header/currency_history_title.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/views/items/currency_history_item.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:calculator_converter/common/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ConversionHistoryScreen extends StatelessWidget {
  const ConversionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<ConversionHistoryCubit, ConversionHistoryState>(
          builder: (context, state) {
        ConversionHistoryCubit conversionHistoryCubit =
            ConversionHistoryCubit.get(context);
        return conversionHistoryCubit.conversionsHistoryValues.isEmpty
            ? const CurrencyHistoryEmpty()
            : state is ConversionHistoryLoading
                ? const LoadingIndicator()
                : state is ConversionHistoryLoaded
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 5.h,
                              ),
                              const CurrencyHistoryTitle(
                                title: AppStrings.currencyHistoryPageTitle,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                removeBottom: true,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.conversionDatesHistory.length
                                      ,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 1.h),
                                      child: CurrencyHistoryItem(
                                        conversionHistoryDate:
                                            state.conversionDatesHistory,
                                        conversionHistoryValues: state.conversionValuesHistory,
                                        index: index,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                    thickness: 0.2.w,
                                    color: AppColors.mainGreenColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      )
                    : const ErrorScreen();
      }),
    );
  }
}
