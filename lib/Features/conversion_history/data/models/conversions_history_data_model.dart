import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history_data.dart';

class ConversionHistoryDataModel extends ConversionHistoryData {
  const ConversionHistoryDataModel({
    required super.conversionsDates,
    required super.conversionsValues,
  });

  factory ConversionHistoryDataModel.fromJson(Map<String, dynamic> json) {
    return ConversionHistoryDataModel(
      conversionsDates: List<String>.from(json.keys),
      conversionsValues: List<num>.from(json.values),
    );
  }


}
