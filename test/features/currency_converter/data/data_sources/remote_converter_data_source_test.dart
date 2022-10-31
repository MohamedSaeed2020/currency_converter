import 'package:calculator_converter/Cores/network/api_constants.dart';
import 'package:calculator_converter/Cores/network/api_end_points.dart';
import 'package:calculator_converter/Cores/network/dio_helper.dart';
import 'package:calculator_converter/Cores/network/error_model.dart';
import 'package:calculator_converter/Cores/network/exception_mapper.dart';
import 'package:calculator_converter/Features/currency_converter/data/data_source/remote_converter_data_source.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/country_currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../Utils/Constants/remote_converter_data_source.dart';
import 'remote_converter_data_source_test.mocks.dart';

@GenerateMocks([DioHelper])
void main() {
  late RemoteConverterDataSource remoteConverterDataSource;
  late DioHelper mockDioHelper;
  setUp(() {
    mockDioHelper = MockDioHelper();
    remoteConverterDataSource = RemoteConverterDataSource(mockDioHelper);
  });

  group(
      'Checking that all functionality of remote converter data source is working as expected',
      () {
    test(
        ' Testing that getAllCountriesCurrencies method return all countries currencies with status code 200',
        () async {
      //Arrange
      CountryCurrencyModel currencies =
          RemoteConverterDataSourceConstants.currencies;
      final mapResult = currencies.toJson();
      when(mockDioHelper
          .getData(url: ApiEndPoints.allCountriesCurrenciesEndPoint, query: {
        'apiKey': ApiConstants.apiKey,
      })).thenAnswer(
        (realInvocation) => Future.value(Response(
          requestOptions: RequestOptions(
            path: ApiConstants.baseUrl,
          ),
          data: mapResult,
          statusCode: 200,
        )),
      );
      //Act
      final result =
          await remoteConverterDataSource.getAllCountriesCurrencies();

      //Assert
      expect(result, currencies);
    });

    test(
        ' Testing that getAllCountriesCurrencies method throw RemoteServerException when statusCode is not 200',
        () async {
      //Arrange

      ErrorModel errorModel = RemoteConverterDataSourceConstants.errorModel;
      final mapResult = errorModel.toJson();
      final expectedResult = throwsA(predicate((model) => model is RemoteServerException));
      when(mockDioHelper
          .getData(url: ApiEndPoints.allCountriesCurrenciesEndPoint, query: {
        'apiKey': ApiConstants.apiKey,
      })).thenAnswer(
        (realInvocation) => Future.value(Response(
          requestOptions: RequestOptions(
            path: ApiConstants.baseUrl,
          ),
          statusCode: 400,
          data: mapResult,
        )),
      );
      //Act
     result() async => await remoteConverterDataSource.getAllCountriesCurrencies();

      //Assert
      expect(result, expectedResult);
    });
  });
}
