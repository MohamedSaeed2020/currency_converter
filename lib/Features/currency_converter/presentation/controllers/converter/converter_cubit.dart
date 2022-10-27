import 'dart:developer';
import 'package:calculator_converter/Cores/Helpers/extensions/math_extensions.dart';
import 'package:calculator_converter/Cores/services/hive_service.dart';
import 'package:calculator_converter/Cores/services/navigation/service.dart';
import 'package:calculator_converter/Cores/services/services_locator.dart';
import 'package:calculator_converter/Cores/use_case/base_use_case.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/controllers/conversion_history_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:calculator_converter/Features/currency_converter/domain/use_cases/all_countries_currencies_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/domain/use_cases/currencies_conversion_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/views/numeric_keyboard/exceed_input_limit_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

part 'converter_state.dart';

class ConverterCubit extends Cubit<ConverterState> {
  ConverterCubit(this.allCurrenciesUseCase, this.currenciesConversionUseCase)
      : super(ConverterInitial());

  ///Variables
  AllCountriesCurrenciesUseCase allCurrenciesUseCase;
  CurrenciesConversionUseCase currenciesConversionUseCase;
  final currencies = <Currency>[];
  final conversionsValues = <num>[];

  /// Value Limit For Exceeding Notify
  static const maxValueLimit = 999999;

  /// Getting and Formatting Current Dates
  String get currentDate => DateFormat('dd.MM.yyyy').format(selectedDateValue);

  String get formattedDate =>
      DateFormat('MMMM dd, yyyy').format(selectedDateValue);

  /// RxDart Stream Controllers
  final _fromConversionValueIndicatorController = BehaviorSubject<Currency>();
  final _toConversionValueIndicatorController = BehaviorSubject<Currency>();
  final _typedConversionValueController = BehaviorSubject<double>.seeded(0);
  final _conversionValueController = BehaviorSubject<double>.seeded(0);
  final _selectedDateController =
      BehaviorSubject<DateTime>.seeded(DateTime.now());

  ///Methods
  static ConverterCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> onInit() async {
    emit(CurrencyLoading());
    currencies.clear();
    try {
      await _checkIsCurrencyCached();
      _checkEmittingState(currencies, emit);
    } on Exception catch (e) {
      emit(CurrencyError());
      log('Exception during fetching currency details 😥 $e');
    }
  }

  Future<void> _checkIsCurrencyCached() async {
    if (locator<HiveService>().checkDateIsCached(currentDate)) {
      log('Cached');
      final cachedCurrenciesData =
          locator<HiveService>().fetchCachedCurrenciesWithDate(currentDate);
      cachedCurrenciesData.forEach(currencies.add);
    } else {
      log('Online');
      await getAllCurrencies();
    }
    _addDefaultValuesToControllers();
    await convertCurrencies();
  }

  Future<void> getAllCurrencies() async {
    final result = await allCurrenciesUseCase(const NoParameters());
    result.fold(
      (failure) {
        log('getAllCurrencies failure: ${failure.errorMessage}');
      },
      (currency) async {
        currencies.addAll(currency.results.values);
        await locator<HiveService>()
            .storeCachedCurrenciesWithDate(currentDate, currencies);
        log('getAllCurrencies allCurrencies: ${currencies.first.id}');
      },
    );
  }

  void _checkEmittingState(List<Currency> currencies, emit) {
    if (currencies.isEmpty) {
      emit(CurrencyError());
      log('Cannot fetch currency details 😥');
      return;
    }
    log('Currency details has been fetched successfully 💱');
    emit(CurrencyLoaded(
      currencies,
    ));
  }

  void _addDefaultValuesToControllers() {
    _fromConversionValueIndicatorController.add(currencies.elementAt(0));
    _toConversionValueIndicatorController.add(currencies.elementAt(1));
    _typedConversionValueController.add(1);
  }

  Future<void> convertCurrencies() async {
    final result = await currenciesConversionUseCase(
      ConversionData(
        fromConversionValue.currencyId,
        toConversionValue.currencyId,
      ),
    );
    conversionsValues.clear();

    result.fold(
      (failure) {
        log('convertCurrencies failure: ${failure.errorMessage}');
      },
      (conversion) async {
        conversionsValues.addAll(conversion.conversionsValues);
        _conversionValueController
            .add(conversionsValues.first * typedConversionValue);
        await getConversionHistory();
        log('convertCurrencies allCurrencies: ${conversion.conversionsValues.first}');
      },
    );
  }

  Future<void> getConversionHistory() async {
    ConversionHistoryCubit conversionHistoryCubit = ConversionHistoryCubit.get(
        NavigationService.navigationKey.currentContext);
    await conversionHistoryCubit.getConversionsHistory();
  }

  Future<void> refreshFromConversionValueWithIndex(int value) async {
    _fromConversionValueIndicatorController.add(currencies.elementAt(value));
    await convertCurrencies();
  }

  Future<void> refreshToConversionValueWithIndex(int value) async {
    _toConversionValueIndicatorController.add(currencies.elementAt(value));
    await convertCurrencies();
  }

  Future<void> exchangeCurrencyConversions() async {
    final fromCurrency = fromConversionValue; //get the value before exchange
    _fromConversionValueIndicatorController.add(toConversionValue);
    _toConversionValueIndicatorController.add(fromCurrency);
    final typedValue = typedConversionValue;

    _typedConversionValueController.add(conversionValue);
    _conversionValueController.add(typedValue);
    await convertCurrencies();
  }

  ///Keyboard Methods
  Future<void> insertToTypedValueRate(int value, BuildContext context) async {
    if (typedConversionValue < maxValueLimit) {
      _typedConversionValueController.add((typedConversionValue * 10) + value);
      await convertCurrencies();
    } else {
      showExceedInputLimitInfoDialog(
        context: context,
      );
    }
  }

  void showExceedInputLimitInfoDialog({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const ExceedInputLimitInfoDialog(),
    );
  }

  Future<void> deleteDigitOneByOneFromTypedValue() async {
    if (typedConversionValue > 1) {
      _typedConversionValueController
          .add(typedConversionValue.makeLastDigitDropped);
    } else {
      _typedConversionValueController.add(0);
    }
    await convertCurrencies();
  }

  Future<void> deleteAllDigitsFromTypedValue() async {
    _typedConversionValueController.add(0);
    await convertCurrencies();
  }

  @override
  Future<void> close() {
    _fromConversionValueIndicatorController.close();
    _toConversionValueIndicatorController.close();
    _typedConversionValueController.close();
    _conversionValueController.close();
    _selectedDateController.close();
    locator<HiveService>().close();
    return super.close();
  }
}

///Extension Methods
extension CurrencyBlocFromConversionValueIndicatorControllerRxExtension
    on ConverterCubit {
  Stream<Currency> get fromConversionStream =>
      _fromConversionValueIndicatorController.stream;

  Currency get fromConversionValue =>
      _fromConversionValueIndicatorController.value;
}

extension CurrencyBlocToConversionValueIndicatorControllerRxExtension
    on ConverterCubit {
  Stream<Currency> get toConversionStream =>
      _toConversionValueIndicatorController.stream;

  Currency get toConversionValue => _toConversionValueIndicatorController.value;
}

extension CurrencyBlocTypedConversionValueControllerRxExtension
    on ConverterCubit {
  Stream<double> get typedConversionStream =>
      _typedConversionValueController.stream;

  double get typedConversionValue => _typedConversionValueController.value;
}

extension CurrencyBlocConversionValueControllerRxExtension on ConverterCubit {
  Stream<double> get conversionStream => _conversionValueController.stream;

  double get conversionValue => _conversionValueController.value;
}

extension CurrencyBlocSelectedDateControllerRxExtension on ConverterCubit {
  DateTime get selectedDateValue => _selectedDateController.value;
}
