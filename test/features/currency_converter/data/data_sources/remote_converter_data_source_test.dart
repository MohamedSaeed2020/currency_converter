import 'package:calculator_converter/Cores/network/api_constants.dart';
import 'package:calculator_converter/Cores/network/api_end_points.dart';
import 'package:calculator_converter/Cores/network/dio_helper.dart';
import 'package:calculator_converter/Features/currency_converter/data/data_source/remote_converter_data_source.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/country_currency_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
        ' Testing that getAllCountriesCurrencies method return all countries currencies',
        () async {
      //Arrange
      const currencies = CountryCurrencyModel(results: {
        'AF': CurrencyModel(
          alpha3: 'AFG',
          currencyId: 'AFN',
          currencyName: 'Afghan afghani',
          currencySymbol: '؋',
          id: 'AF',
          name: 'Afghanistan',
        ),
        'AI': CurrencyModel(
          alpha3: 'AIA',
          currencyId: 'XCD',
          currencyName: 'East Caribbean dollar',
          currencySymbol: '\$',
          id: 'AI',
          name: 'Anguilla',
        ),
      });
      final mapResult = {
        'results': {
          'AF': {
            'alpha3': 'AFG',
            'currencyId': 'AFN',
            'currencyName': 'Afghan afghani',
            'currencySymbol': '؋',
            'id': 'AF',
            'name': 'Afghanistan',
          },
          'AI': {
            'alpha3': 'AIA',
            'currencyId': 'XCD',
            'currencyName': 'East Caribbean dollar',
            'currencySymbol': '\$',
            'id': 'AI',
            'name': 'Anguilla',
          },
        }
      };
      when(mockDioHelper
          .getData(url: ApiEndPoints.allCountriesCurrenciesEndPoint, query: {
        'apiKey': ApiConstants.apiKey,
      })).thenAnswer(
        (realInvocation) => Future.value(Response(
          requestOptions: RequestOptions(
              path: ApiEndPoints.allCountriesCurrenciesEndPoint,
              data: {
                'apiKey': ApiConstants.apiKey,
              }),
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
  });
}
