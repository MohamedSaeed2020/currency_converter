import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/conversions.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/country_currency.dart';
import 'package:dartz/dartz.dart';

abstract class BaseConverterRepository {
  Future<Either<GeneralFailureModel, CountryCurrency>> getAllCountriesCurrencies();
  Future<Either<GeneralFailureModel, CurrencyConversion>> getCurrenciesConversions({required String fromCurrency, required String toCurrency});
}
