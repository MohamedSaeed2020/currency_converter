part of 'conversion_history_cubit.dart';

abstract class ConversionHistoryState {}

class ConversionHistoryInitial extends ConversionHistoryState {}

class ConversionHistoryLoading extends ConversionHistoryState {}

class ConversionHistoryLoaded extends ConversionHistoryState {
  final List<num> conversionsHistoryValues;
  final List<String> conversionsHistoryDate;

  ConversionHistoryLoaded(
    this.conversionsHistoryValues,
    this.conversionsHistoryDate,
  );
}

class ConversionHistoryError extends ConversionHistoryState {}
