import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history.dart';
import 'package:dartz/dartz.dart';

abstract class BaseConversionHistoryRepository {
  Future<Either<GeneralFailureModel, ConversionHistory>> getConversionsHistory(
      {required String fromCurrency, required String toCurrency});
}
