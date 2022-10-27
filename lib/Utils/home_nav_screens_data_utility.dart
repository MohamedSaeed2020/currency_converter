import 'package:calculator_converter/Features/currency_converter/presentation/screens/conversion_screen/currency_converter_screen.dart';
import 'package:calculator_converter/Features/conversion_history/presentation/screens/conversion_history/conversion_history_screen.dart';

class HomeNavScreensDataUtility {
  static List getNavScreens() {
    final screens = [
      const CurrencyConverterScreen(),
      const ConversionHistoryScreen(),
    ];
    return screens;
  }
}
