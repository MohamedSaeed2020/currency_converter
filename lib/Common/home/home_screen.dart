import 'package:calculator_converter/Common/home/widgets/bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/controllers/conversion_history_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/home/home_cubit.dart';
import 'package:calculator_converter/Utils/home_nav_screens_data_utility.dart';
import 'package:calculator_converter/common/error_screen.dart';
import 'package:calculator_converter/common/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  static final _pages = HomeNavScreensDataUtility.getNavScreens();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<ConversionHistoryCubit, ConversionHistoryState>(
        builder: (context, conversionHistoryState) {
          return BlocBuilder<ConverterCubit, ConverterState>(
            builder: (context, converterState) {
              return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    HomeCubit homeCubit = HomeCubit.get(context);

                    if (converterState is CurrencyLoading) {
                      return const LoadingIndicator();
                    }
                    if (converterState is CurrencyLoaded) {
                      return _pages[homeCubit.index];
                    }
                    if (converterState is CurrencyError) {
                      return const ErrorScreen();
                    }
                    if (conversionHistoryState is ConversionHistoryError) {
                      return const ErrorScreen();
                    }
                    return _pages[homeCubit.index];
                  });
            },
          );
        },
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
