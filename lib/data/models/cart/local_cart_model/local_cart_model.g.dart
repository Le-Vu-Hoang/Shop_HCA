// GENERATED CODE - MANUALLY WRITTEN

part of 'local_cart_model.dart';

class LocalCartModelAdapter extends TypeAdapter<LocalCartModel> {
  @override
  final int typeId = 2;

  @override
  LocalCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCartModel(
      brandId: fields[0] as String,
      brandName: fields[1] as String,
      brandImage: fields[2] as String,
      items: (fields[3] as List).cast<LocalCartItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalCartModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.brandId)
      ..writeByte(1)
      ..write(obj.brandName)
      ..writeByte(2)
      ..write(obj.brandImage)
      ..writeByte(3)
      ..write(obj.items);
  }
}
