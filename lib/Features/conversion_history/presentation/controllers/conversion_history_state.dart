part of 'conversion_history_cubit.dart';

abstract class ConversionHistoryState {}

class ConversionHistoryInitial extends ConversionHistoryState {}

class ConversionHistoryLoading extends ConversionHistoryState {}

class ConversionHistoryLoaded extends ConversionHistoryState {
  final ConversionHistoryData conversionHistory;

  ConversionHistoryLoaded(
    this.conversionHistory,
  );
}

class ConversionHistoryError extends ConversionHistoryState {}
