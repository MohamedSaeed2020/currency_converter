import 'package:calculator_converter/Features/currency_converter/domain/entities/conversions.dart';

class CurrencyConversionModel extends CurrencyConversion {
  const CurrencyConversionModel({
    required super.countriesIds,
    required super.conversionsValues,
  });

  factory CurrencyConversionModel.fromJson(Map<String, dynamic> json) {
    return CurrencyConversionModel(
      countriesIds: List<String>.from(json.keys),
      conversionsValues: List<num>.from(json.values),
    );
  }
}
