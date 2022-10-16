// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchDataAdapter extends TypeAdapter<_$_SearchData> {
  @override
  final int typeId = 2;

  @override
  _$_SearchData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SearchData(
      keyword: fields[0] as String,
      dateTime: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SearchData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.keyword)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
