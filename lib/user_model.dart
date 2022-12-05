import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  String uid;
  @HiveField(1)
  String gender;
  @HiveField(2)
  String bloodGroup;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String dob;
  @HiveField(5)
  String nextOfKin;
  @HiveField(6)
  bool migrane;
  @HiveField(7)
  bool asthma;
  @HiveField(8)
  bool diabetes;
  @HiveField(9)
  bool heartDisease;
  @HiveField(10)
  bool highBloodPressure;
  @HiveField(11)
  String name;
  @HiveField(12)
  String weight;
  @HiveField(13)
  String height;
  Person({
    required this.uid,
    required this.gender,
    required this.bloodGroup,
    required this.phone,
    required this.dob,
    required this.nextOfKin,
    required this.migrane,
    required this.asthma,
    required this.diabetes,
    required this.heartDisease,
    required this.highBloodPressure,
    required this.name,
    required this.weight,
    required this.height,
  });
}
