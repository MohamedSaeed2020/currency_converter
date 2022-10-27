import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Cores/use_case/base_use_case.dart';
import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history.dart';
import 'package:calculator_converter/Features/conversion_history/domain/repository/base_conversion_history_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ConversionsHistoryUseCase
    extends BaseUseCase<ConversionHistory, ConversionData> {
  BaseConversionHistoryRepository baseConversionHistoryRepository;

  ConversionsHistoryUseCase(this.baseConversionHistoryRepository);

  @override
  Future<Either<GeneralFailureModel, ConversionHistory>> call(
      ConversionData parameters) async {
    return await baseConversionHistoryRepository.getConversionsHistory(
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
