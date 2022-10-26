import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({
    required super.alpha3,
    required super.currencyId,
    required super.currencyName,
    required super.currencySymbol,
    required super.id,
    required super.name,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        alpha3: json["alpha3"],
        currencyId: json["currencyId"],
        currencyName: json["currencyName"],
        currencySymbol: json["currencySymbol"],
        id: json["id"],
        name: json["name"],
      );
}
