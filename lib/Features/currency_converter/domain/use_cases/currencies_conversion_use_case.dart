import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Cores/use_case/base_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/conversions.dart';
import 'package:calculator_converter/Features/currency_converter/domain/repository/base_converter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CurrenciesConversionUseCase
    extends BaseUseCase<CurrencyConversion, ConversionData> {
  BaseConverterRepository baseConverterRepository;

  CurrenciesConversionUseCase(this.baseConverterRepository);

  @override
  Future<Either<GeneralFailureModel, CurrencyConversion>> call(
      ConversionData parameters) async {
    return await baseConverterRepository.getCurrenciesConversions(
      fromCurrency: parameters.fromCurrency,
      toCurrency: parameters.toCurrency,
    );
  }
}

class ConversionData extends Equatable {
  final String fromCurrency;
  final String toCurrency;

  const ConversionData(this.fromCurrency, this.toCurrency);

  @override
  List<Object> get props => [fromCurrency, toCurrency];
}
