// GENERATED CODE - MANUALLY WRITTEN

part of 'local_cart_item_model.dart';

class LocalCartItemModelAdapter extends TypeAdapter<LocalCartItemModel> {
  @override
  final int typeId = 3;

  @override
  LocalCartItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCartItemModel(
      id: fields[0] as String,
      variantId: fields[1] as String,
      imageLink: fields[2] as String,
      amount: fields[3] as int,
      pinned: fields[4] as bool,
      productVariant: fields[5] as LocalProductVariantModel,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCartItemModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.variantId)
      ..writeByte(2)
      ..write(obj.imageLink)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.pinned)
      ..writeByte(5)
      ..write(obj.productVariant);
  }
}
