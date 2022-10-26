import 'package:calculator_converter/Cores/network/exception_mapper.dart';
import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/data_source/remote_converter_data_source.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/conversions.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/country_currency.dart';
import 'package:calculator_converter/Features/currency_converter/domain/repository/base_converter_repository.dart';
import 'package:dartz/dartz.dart';

class ConverterRepository extends BaseConverterRepository {
  BaseRemoteConverterDataSource baseRemoteConverterDataSource;

  ConverterRepository(this.baseRemoteConverterDataSource);

  @override
  Future<Either<GeneralFailureModel,
      CountryCurrency>> getAllCountriesCurrencies() async {
    try {
      final result = await baseRemoteConverterDataSource
          .getAllCountriesCurrencies();
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.errorMessage));
    }
  }

  @override
  Future<
      Either<GeneralFailureModel, CurrencyConversion>> getCurrenciesConversions(
      {required String fromCurrency, required String toCurrency}) async {
    try {
      final result = await baseRemoteConverterDataSource
          .getCurrenciesConversions(fromCurrency: fromCurrency, toCurrency: toCurrency);
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.errorMessage));
    }
  }
}
