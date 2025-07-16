// GENERATED CODE - MANUALLY WRITTEN

part of 'local_product_variant_model.dart';

class LocalProductVariantModelAdapter extends TypeAdapter<LocalProductVariantModel> {
  @override
  final int typeId = 4;

  @override
  LocalProductVariantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalProductVariantModel(
      name: fields[0] as String,
      price: fields[1] as int,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalProductVariantModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.status);
  }
}
