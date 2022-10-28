import 'package:equatable/equatable.dart';

class ConversionHistory extends Equatable {
  final List<String> countriesConversionsIds;
  final List<dynamic> conversionsHistoryData;

  const ConversionHistory(
      {required this.countriesConversionsIds,
      required this.conversionsHistoryData});

  @override
  List<Object> get props => [countriesConversionsIds, conversionsHistoryData];


}
