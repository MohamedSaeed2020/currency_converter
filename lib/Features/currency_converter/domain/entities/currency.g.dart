// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 0;

  @override
  Currency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Currency(
      alpha3: fields[0] as String,
      currencyId: fields[1] as String,
      currencyName: fields[2] as String,
      currencySymbol: fields[3] as String,
      id: fields[4] as String,
      name: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.alpha3)
      ..writeByte(1)
      ..write(obj.currencyId)
      ..writeByte(2)
      ..write(obj.currencyName)
      ..writeByte(3)
      ..write(obj.currencySymbol)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
