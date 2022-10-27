import 'package:calculator_converter/Cores/network/exception_mapper.dart';
import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Features/conversion_history/data/data_sources/remote_conversions_history_data_source.dart';
import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history.dart';
import 'package:calculator_converter/Features/conversion_history/domain/repository/base_conversion_history_repository.dart';
import 'package:dartz/dartz.dart';

class ConversionHistoryRepository extends BaseConversionHistoryRepository {
  BaseRemoteConversionsHistoryDataSource baseRemoteConversionsHistoryDataSource;

  ConversionHistoryRepository(this.baseRemoteConversionsHistoryDataSource);

  @override
  Future<Either<GeneralFailureModel, ConversionHistory>> getConversionsHistory(
      {required String fromCurrency, required String toCurrency}) async {
    try {
      final result =
          await baseRemoteConversionsHistoryDataSource.getConversionsHistory(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
      );
      return Right(result);
    } on RemoteServerException catch (exception) {

      return Left(RemoteServerFailure(exception.errorModel.errorMessage));
    }
  }
}
