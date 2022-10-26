import 'package:calculator_converter/Cores/network/general_failure_model.dart';
import 'package:calculator_converter/Cores/use_case/base_use_case.dart';
import 'package:calculator_converter/Features/currency_converter/domain/entities/country_currency.dart';
import 'package:calculator_converter/Features/currency_converter/domain/repository/base_converter_repository.dart';
import 'package:dartz/dartz.dart';

class AllCountriesCurrenciesUseCase extends BaseUseCase<CountryCurrency, NoParameters> {
  BaseConverterRepository baseConverterRepository;

  AllCountriesCurrenciesUseCase(this.baseConverterRepository);

  @override
  Future<Either<GeneralFailureModel, CountryCurrency>> call(
      NoParameters parameters) async {
    return await baseConverterRepository.getAllCountriesCurrencies();
  }
}
