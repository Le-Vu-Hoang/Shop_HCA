// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'local_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserModelAdapter extends TypeAdapter<LocalUserModel> {
  @override
  final int typeId = 1;

  @override
  LocalUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUserModel(
      id: fields[0] as String,
      imageLink: fields[1] as String?,
      fullName: fields[2] as String?,
      accountName: fields[3] as String,
      birthday: fields[4] as String?,
      email: fields[5] as String,
      numberPhone: fields[6] as String?,
      isLocked: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageLink)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.accountName)
      ..writeByte(4)
      ..write(obj.birthday)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.numberPhone)
      ..writeByte(7)
      ..write(obj.isLocked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LocalUserModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
