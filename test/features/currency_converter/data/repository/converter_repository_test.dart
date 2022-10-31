import 'package:calculator_converter/Features/currency_converter/data/data_source/remote_converter_data_source.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/country_currency_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/repository/converter_repository.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/country_currency.dart';
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

  });
}
