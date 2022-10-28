import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'conversions_history_data.g.dart';

@HiveType(typeId: 1)
class ConversionHistoryData extends Equatable {
  @HiveField(0)
  final List<String> conversionsDates;
  @HiveField(1)
  final List<num> conversionsValues;

  const ConversionHistoryData(
      {required this.conversionsDates, required this.conversionsValues});

  @override
  List<Object> get props => [conversionsDates, conversionsValues];


}
