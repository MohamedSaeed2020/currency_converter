import 'package:calculator_converter/Cores/Helpers/app_helpers.dart';
import 'package:calculator_converter/Cores/Helpers/extensions/date_extensions.dart';
import 'package:calculator_converter/Cores/network/api_constants.dart';
import 'package:calculator_converter/Cores/network/api_end_points.dart';
import 'package:calculator_converter/Cores/network/dio_helper.dart';
import 'package:calculator_converter/Cores/network/error_model.dart';
import 'package:calculator_converter/Cores/network/exception_mapper.dart';
import 'package:calculator_converter/Features/conversion_history/data/models/conversions_history_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteConversionsHistoryDataSource {
  Future<ConversionHistoryModel> getConversionsHistory(
      {required String fromCurrency, required String toCurrency});
}

class RemoteConversionsHistoryDataSource
    extends BaseRemoteConversionsHistoryDataSource {
  @override
  Future<ConversionHistoryModel> getConversionsHistory(
      {required String fromCurrency, required String toCurrency}) async {
    final Response response = await DioHelper.getData(
      url: ApiEndPoints.convertCurrenciesEndPoint,
      query: {
        'apiKey': ApiConstants.apiKey,
        'compact': 'ultra',
        'endDate': DateTime.now().formatDate(),
        'date': AppHelpers.subtractDates(6),
        'q': '${fromCurrency}_$toCurrency,${toCurrency}_$fromCurrency',
      },
    );

    if (response.statusCode == 200) {
      return ConversionHistoryModel.fromJson(response.data);
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
