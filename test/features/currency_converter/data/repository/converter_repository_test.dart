import 'package:calculator_converter/Cores/network/exception_mapper.dart';
import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/data_source/remote_converter_data_source.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/conversions_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/country_currency_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/repository/converter_repository.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/conversions.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/country_currency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../Utils/Constants/remote_converter_data_source.dart';
import 'converter_repository_test.mocks.dart';

@GenerateMocks([BaseRemoteConverterDataSource])
void main() {
  late BaseRemoteConverterDataSource mockBaseRemoteConverterDataSource;
  late ConverterRepository converterRepository;
  setUp(() {
    mockBaseRemoteConverterDataSource = MockBaseRemoteConverterDataSource();
    converterRepository =
        ConverterRepository(mockBaseRemoteConverterDataSource);
  });

  group(
      'Checking that all functionality of  getAllCountriesCurrencies is working as expected',
      () {
    test(
        ' Testing that getAllCountriesCurrencies method return all countries currencies with status code 200',
        () async {
      //Arrange
      CountryCurrencyModel currencies =
          RemoteConverterDataSourceConstants.currenciesWithId;
      when(mockBaseRemoteConverterDataSource.getAllCountriesCurrencies())
          .thenAnswer((_) => Future.value(currencies));
      //Act
      final result = await converterRepository.getAllCountriesCurrencies();
      late CountryCurrency rightResult;
      result.fold((l) {}, (r) {
        rightResult = r;
      });
      //Assert
      expect(rightResult, currencies);
    });

    test(
        ' Testing that getAllCountriesCurrencies method return throw RemoteServerException when statusCode is not 200',
        () async {
      //Arrange
      RemoteServerException remoteServerException =
          RemoteConverterDataSourceConstants.remoteServerExceptionModel;
      when(mockBaseRemoteConverterDataSource.getAllCountriesCurrencies())
          .thenThrow(remoteServerException);
      RemoteServerFailure remoteServerFailure =
          RemoteConverterDataSourceConstants.remoteServerFailureModel;
      //Act
      final result = await converterRepository.getAllCountriesCurrencies();
      late RemoteServerFailure leftResult;
      result.fold((l) {
        leftResult = l as RemoteServerFailure;
      }, (r) {});

      //Assert
      expect(result, Left(remoteServerFailure));
    });
  });

  group(
      'Checking that all functionality of  getCurrenciesConversions is working as expected',
      () {
    const String fromCurrency = 'USD';
    const String toCurrency = 'EGP';
    test(
        ' Testing that getCurrenciesConversions method return all currencies conversions with status code 200',
        () async {
      //Arrange
      CurrencyConversionModel conversions =
          RemoteConverterDataSourceConstants.conversions;
      when(mockBaseRemoteConverterDataSource.getCurrenciesConversions(
              fromCurrency: fromCurrency, toCurrency: toCurrency))
          .thenAnswer((_) => Future.value(conversions));
      //Act
      final result = await converterRepository.getCurrenciesConversions(fromCurrency: fromCurrency, toCurrency: toCurrency);
      late CurrencyConversion rightResult;
      result.fold((l) {}, (r) {
        rightResult = r;
      });
      //Assert
      expect(rightResult, conversions);
    });

    test(
        ' Testing that getCurrenciesConversions method return throw RemoteServerException when statusCode is not 200',
        () async {
      //Arrange
      RemoteServerException remoteServerException =
          RemoteConverterDataSourceConstants.remoteServerExceptionModel;
      when(mockBaseRemoteConverterDataSource.getCurrenciesConversions(fromCurrency: fromCurrency, toCurrency: toCurrency))
          .thenThrow(remoteServerException);
      RemoteServerFailure remoteServerFailure =
          RemoteConverterDataSourceConstants.remoteServerFailureModel;
      //Act
      final result = await converterRepository.getCurrenciesConversions(fromCurrency: fromCurrency, toCurrency: toCurrency);
      late RemoteServerFailure leftResult;
      result.fold((l) {
        leftResult = l as RemoteServerFailure;
      }, (r) {});

      //Assert
      expect(result, Left(remoteServerFailure));
    });
  });
}
