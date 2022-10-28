import 'package:calculator_converter/Features/conversion_history/domain/entities/conversions_history_data.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  late Box currencyBox;
  late Box primitiveBox;
  late Box currencyHistoryBox;

  Future<void> initHiveService() async {
    // getting application document directory
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final appDocumentPath = appDocumentDirectory.path;

    //initialize [HiveAdapter] logic
    Hive.init(appDocumentPath);

    // register CurrencyAdapter component
    Hive.registerAdapter(CurrencyAdapter());

    // register CurrencyHistoryAdapter component
    Hive.registerAdapter(ConversionHistoryDataAdapter());

    // opening Currency Box component
    currencyBox = await Hive.openBox('currency_view_box');
    primitiveBox = await Hive.openBox('primitive_view_box');

    //opening CurrencyConversionHistoryBox component
    currencyHistoryBox = await Hive.openBox('currency_history_box');
  }

  Future<void> storeCachedCurrenciesWithDate(
    String date,
    List<Currency?>? value,
  ) async {
    //currencyBox.clear();
    await currencyBox.put(date, value);
  }

  fetchCachedCurrenciesWithDate(String date) =>
      currencyBox.get(date, defaultValue: <Currency>[]);

  bool checkDateIsCached(String date) => currencyBox.containsKey(date);

  Future<void> storeCurrenciesToHistoryWithKey(
      List<dynamic?>? value, String key) async {
    //currencyHistoryBox.clear();
    await currencyHistoryBox.put(key, value);
  }

  clearAllBoxesData() {
    currencyBox.clear();
    currencyHistoryBox.clear();
    primitiveBox.clear();
  }

  fetchCurrenciesHistoryWithKey(String key) {
    return primitiveBox.get(key, defaultValue: []);
  }

  bool checkHistoryIsNotEmpty(String key) => primitiveBox.containsKey(key);

  void close() {
    Hive.close();
  }
}
