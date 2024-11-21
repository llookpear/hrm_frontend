// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreSystemDataAdapter extends TypeAdapter<StoreSystemData> {
  @override
  final int typeId = 1;

  @override
  StoreSystemData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreSystemData()
      ..accessToken = fields[0] as String?
      ..companyID = fields[1] as String?
      ..lastUsernameLogin = fields[2] as String?
      ..languageCode = fields[3] as String
      ..countryCode = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, StoreSystemData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.lastUsernameLogin)
      ..writeByte(3)
      ..write(obj.languageCode)
      ..writeByte(4)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreSystemDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
