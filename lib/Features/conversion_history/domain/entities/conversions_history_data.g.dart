// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversions_history_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversionHistoryDataAdapter extends TypeAdapter<ConversionHistoryData> {
  @override
  final int typeId = 1;

  @override
  ConversionHistoryData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversionHistoryData(
      conversionsDates: (fields[0] as List).cast<String>(),
      conversionsValues: (fields[1] as List).cast<num>(),
    );
  }

  @override
  void write(BinaryWriter writer, ConversionHistoryData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.conversionsDates)
      ..writeByte(1)
      ..write(obj.conversionsValues);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionHistoryDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
