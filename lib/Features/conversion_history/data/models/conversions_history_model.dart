import 'package:calculator_converter/Features/conversion_history/data/models/conversions_history_data_model.dart';
import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history.dart';

class ConversionHistoryModel extends ConversionHistory {
  const ConversionHistoryModel({
    required super.countriesConversionsIds,
    required super.conversionsHistoryData,
  });

  factory ConversionHistoryModel.fromJson(Map<String, dynamic> json) {
    return ConversionHistoryModel(
      countriesConversionsIds: List<String>.from(json.keys),
      conversionsHistoryData: json.values
          .map((conversionData) =>
              ConversionHistoryDataModel.fromJson(conversionData))
          .toList(),
    );
  }
}
