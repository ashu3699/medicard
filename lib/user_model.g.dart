// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      uid: fields[0] as String,
      gender: fields[1] as String,
      bloodGroup: fields[2] as String,
      phone: fields[3] as String,
      dob: fields[4] as String,
      nextOfKin: fields[5] as String,
      migrane: fields[6] as bool,
      asthma: fields[7] as bool,
      diabetes: fields[8] as bool,
      heartDisease: fields[9] as bool,
      highBloodPressure: fields[10] as bool,
      name: fields[11] as String,
      weight: fields[12] as String,
      height: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.bloodGroup)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.nextOfKin)
      ..writeByte(6)
      ..write(obj.migrane)
      ..writeByte(7)
      ..write(obj.asthma)
      ..writeByte(8)
      ..write(obj.diabetes)
      ..writeByte(9)
      ..write(obj.heartDisease)
      ..writeByte(10)
      ..write(obj.highBloodPressure)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.weight)
      ..writeByte(13)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
