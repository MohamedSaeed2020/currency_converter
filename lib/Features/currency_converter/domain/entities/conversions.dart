import 'package:equatable/equatable.dart';

class CurrencyConversion extends Equatable {
  final List<String> countriesIds;
  final List<num> conversionsValues;

  const CurrencyConversion(
      {required this.countriesIds, required this.conversionsValues});

  @override
  List<Object> get props => [countriesIds, conversionsValues];
}
