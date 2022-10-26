import 'dart:async';
import 'package:calculator_converter/Cores/services/navigation/service.dart';
import 'package:calculator_converter/Cores/services/services_locator.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_selection_state.dart';

class CurrencySelectionCubit extends Cubit<CurrencySelectionState> {
  CurrencySelectionCubit() : super(CurrencySelectionInitial());

  static CurrencySelectionCubit get(context) {
    return BlocProvider.of(context);
  }

  void selectCurrencyItem(int index, bool toConversion, BuildContext context) {
    Timer(
      (const Duration(milliseconds: 115)),
      () => _refreshCurrentCurrencyValue(toConversion, context, index),
    );
    emit(CurrencyIsSelected());
  }

  void _refreshCurrentCurrencyValue(
      bool toConversion, BuildContext context, int index) {
    ConverterCubit converterCubit = ConverterCubit.get(context);
    if (toConversion) {
      converterCubit.refreshToConversionValueWithIndex(index);
    } else {
      converterCubit.refreshFromConversionValueWithIndex(index);
    }
    _comeBack(context);
  }

  void _comeBack(context) => locator<NavigationService>().back(context);
}
