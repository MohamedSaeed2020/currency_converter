import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  late Box currencyBox;
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
    //Hive.registerAdapter(CurrencyHistoryAdapter());

    // opening Currency Box component
    currencyBox = await Hive.openBox('currency_view_box');

    //opening CurrencyConversionHistoryBox component
    //currencyHistoryBox = await Hive.openBox('currency_history_box');
  }

  Future<void> storeCachedCurrenciesWithDate(
      String date, List<Currency?>? value) async {
    currencyBox.clear();
    await currencyBox.put(date, value);
  }

  fetchCachedCurrenciesWithDate(String date) =>
      currencyBox.get(date, defaultValue: <Currency>[]);

  bool checkDateIsCached(String date) => currencyBox.containsKey(date);

/*  Future<void> storeCurrenciesToHistoryWithKey(
          List<CurrencyHistoryModel?>? value) async =>
      await currencyHistoryViewBox.put('history', value);*/

/*  fetchCurrenciesHistoryWithKey() => currencyHistoryViewBox
      .get('history', defaultValue: <CurrencyHistoryModel>[]);*/

/*  bool checkHistoryIsNotEmpty() =>
      currencyHistoryViewBox.containsKey('history');*/

  //Closing Hive Service
  void close() {
    Hive.close();
  }
}
