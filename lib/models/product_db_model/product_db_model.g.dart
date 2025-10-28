// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDbModelAdapter extends TypeAdapter<ProductDbModel> {
  @override
  final int typeId = 0;

  @override
  ProductDbModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDbModel(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      area: fields[3] as String,
      instructions: fields[4] as String,
      thumbnail: fields[5] as String,
      ingredients: (fields[7] as List).cast<String>(),
      measures: (fields[8] as List).cast<String>(),
      youtube: fields[6] as String?,
      price: fields[11] as double?,
      quantity: fields[9] as int?,
      rating: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDbModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.area)
      ..writeByte(4)
      ..write(obj.instructions)
      ..writeByte(5)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.youtube)
      ..writeByte(7)
      ..write(obj.ingredients)
      ..writeByte(8)
      ..write(obj.measures)
      ..writeByte(9)
      ..write(obj.quantity)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDbModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
