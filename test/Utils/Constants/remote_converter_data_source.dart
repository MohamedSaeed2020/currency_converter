import 'package:calculator_converter/Cores/network/error_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/conversions_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/country_currency_model.dart';
import 'package:calculator_converter/Features/currency_converter/data/models/currency_model.dart';

class RemoteConverterDataSourceConstants {
  static const currencies = CountryCurrencyModel(results: {
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

  static const conversions = CurrencyConversionModel(
      countriesIds: ['USD_EGP', 'EGP_USD'],
      conversionsValues: [5.169343, 0.041397]);

  static const conversionsMap={"USD_EGP": 5.169343, "EGP_USD": 0.041397};

  static const errorModel =
      ErrorModel(statusCode: 400, errorMessage: 'an error occurred');
}
