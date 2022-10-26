import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'currency.g.dart';

@HiveType(typeId: 0)
class Currency extends Equatable {
  @HiveField(0)
  final String alpha3;
  @HiveField(1)
  final String currencyId;
  @HiveField(2)
  final String currencyName;
  @HiveField(3)
  final String currencySymbol;
  @HiveField(4)
  final String id;
  @HiveField(5)
  final String name;

  const Currency({
    required this.alpha3,
    required this.currencyId,
    required this.currencyName,
    required this.currencySymbol,
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [
    alpha3,
    currencyId,
    currencyName,
    currencySymbol,
    id,
    name,
  ];
}