import 'package:calculator_converter/Features/currency_converter/domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

class CountryCurrency extends Equatable {
  final Map<String, Currency> results;

  const CountryCurrency({
    required this.results,
  });

  @override
  List<Object> get props => [results];
}


