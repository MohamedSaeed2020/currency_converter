import 'package:calculator_converter/Cores/services/hive_service.dart';
import 'package:calculator_converter/Cores/services/navigation/service.dart';
import 'package:calculator_converter/Features/currency_converter/data/data_source/remote_converter_data_source.dart';
import 'package:calculator_converter/Features/currency_converter/data/repository/converter_repository.dart';
import 'package:calculator_converter/Features/currency_converter/domain/repository/base_converter_repository.dart';
import 'package:calculator_converter/Features/currency_converter/domain/use_cases/all_countries_currencies_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/domain/use_cases/currencies_conversion_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/currency_selection_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/home/home_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class ServicesLocator {
  static void init() {
    ///Cubits
    locator.registerFactory(() => HomeCubit()); //It is lazy by default.
    locator.registerFactory(() => ConverterCubit(locator(),locator()));
    locator.registerFactory(() => CurrencySelectionCubit());

    ///Data Sources Injection
    locator.registerLazySingleton<BaseRemoteConverterDataSource>(
        () => RemoteConverterDataSource());

    ///Repository Injection
    locator.registerLazySingleton<BaseConverterRepository>(
        () => ConverterRepository(locator()));

    ///Use Cases Injection
    locator
        .registerLazySingleton(() => AllCountriesCurrenciesUseCase(locator()));
    locator
        .registerLazySingleton(() => CurrenciesConversionUseCase(locator()));

    ///Services
    locator.registerLazySingleton<NavigationService>(
      () => const NavigationService(),
    );
    locator.registerLazySingleton<HiveService>(
      () =>  HiveService(),
    );
  }
}
