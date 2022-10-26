import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/currency_converter_screen.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_history/currency_history_page.dart';

class HomeNavScreensDataUtility {
  static List getNavScreens() {
    final screens = [
      const CurrencyConverterScreen(),
      const CurrencyHistoryScreen(),
    ];
    return screens;
  }
}
