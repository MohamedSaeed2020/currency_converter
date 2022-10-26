part of 'converter_cubit.dart';

abstract class ConverterState {}

class ConverterInitial extends ConverterState {}

class CurrencyLoading extends ConverterState {}

class CurrencyLoaded extends ConverterState {
  final List<Currency>? currencies;

  CurrencyLoaded(
    this.currencies,
  );
}

class CurrencyError extends ConverterState {}
