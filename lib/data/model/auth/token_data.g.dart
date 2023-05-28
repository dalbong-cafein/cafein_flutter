// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenDataAdapter extends TypeAdapter<_$_TokenData> {
  @override
  final int typeId = 1;

  @override
  _$_TokenData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_TokenData(
      accessToken: fields[0] as String,
      refreshToken: fields[1] as String,
      accessTokenType: fields[2] as String,
      accessTokenExpires: fields[3] as String,
      refreshTokenExpires: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_TokenData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.accessTokenType)
      ..writeByte(3)
      ..write(obj.accessTokenExpires)
      ..writeByte(4)
      ..write(obj.refreshTokenExpires);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
