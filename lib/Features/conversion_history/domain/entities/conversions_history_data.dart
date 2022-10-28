import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'conversions_history_data.g.dart';

class ConversionHistoryData extends Equatable {
  final List<String> conversionsDates;
  final List<num> conversionsValues;

  const ConversionHistoryData(
      {required this.conversionsDates, required this.conversionsValues});

  @override
  List<Object> get props => [conversionsDates, conversionsValues];


}
