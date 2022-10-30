import 'package:calculator_converter/Cores/network/api_constants.dart';
import 'package:calculator_converter/Cores/network/api_end_points.dart';
import 'package:calculator_converter/Cores/network/dio_helper.dart';
import 'package:calculator_converter/Cores/network/error_model.dart';
import 'package:calculator_converter/Cores/network/exception_mapper.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/conversions_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/country_currency_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteConverterDataSource {
  Future<CountryCurrencyModel> getAllCountriesCurrencies();

  Future<CurrencyConversionModel> getCurrenciesConversions(
      {required String fromCurrency, required String toCurrency});
}

class RemoteConverterDataSource extends BaseRemoteConverterDataSource {
  final DioHelper dioHelper;


  RemoteConverterDataSource(this.dioHelper);

  @override
  Future<CountryCurrencyModel> getAllCountriesCurrencies() async {
    final Response response = await dioHelper.getData(
      url: ApiEndPoints.allCountriesCurrenciesEndPoint,
      query: {
        'apiKey': ApiConstants.apiKey,
      },
    );
    if (response.statusCode == 200) {
      return CountryCurrencyModel.fromJson(response.data);
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<CurrencyConversionModel> getCurrenciesConversions(
      {required String fromCurrency, required String toCurrency}) async {
    final Response response = await dioHelper.getData(
      url: ApiEndPoints.convertCurrenciesEndPoint,
      query: {
        'apiKey': ApiConstants.apiKey,
        'compact': 'ultra',
        'q': '${fromCurrency}_$toCurrency,${toCurrency}_$fromCurrency',
      },
    );
    if (response.statusCode == 200) {
      return CurrencyConversionModel.fromJson(response.data);
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
