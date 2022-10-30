import 'package:calculator_converter/Features/currency_converter/data/models/currency_model.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/country_currency.dart';

class CountryCurrencyModel extends CountryCurrency {
  const CountryCurrencyModel({
    required super.results,
  });

  factory CountryCurrencyModel.fromJson(Map<String, dynamic> json) => CountryCurrencyModel(
        results: Map.from(json["results"]).map((k, v) =>
            MapEntry<String, CurrencyModel>(k, CurrencyModel.fromJson(v))),
      );


}
