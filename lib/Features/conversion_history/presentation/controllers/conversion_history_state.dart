part of 'conversion_history_cubit.dart';

abstract class ConversionHistoryState {}

class ConversionHistoryInitial extends ConversionHistoryState {}

class ConversionHistoryLoading extends ConversionHistoryState {}

class ConversionHistoryLoaded extends ConversionHistoryState {
  final List<num> conversionValuesHistory;
  final List<String> conversionDatesHistory;

  ConversionHistoryLoaded(
    this.conversionValuesHistory,
    this.conversionDatesHistory,
  );
}

class ConversionHistoryError extends ConversionHistoryState {}
