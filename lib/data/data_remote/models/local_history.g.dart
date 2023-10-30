// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalHistorialAdapter extends TypeAdapter<LocalHistorial> {
  @override
  final int typeId = 1;

  @override
  LocalHistorial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalHistorial(
      id: fields[0] as int,
      time: fields[1] as int,
      email: fields[2] as String,
      points: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalHistorial obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalHistorialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}