import 'package:hive/hive.dart';
part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeData extends HiveObject {
  @HiveField(0)
  final String correo;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String firstname;
  @HiveField(3)
  final String lastname;
  @HiveField(4)
  final String birthday;
  @HiveField(5)
  final String course;
  @HiveField(6)
  final String diff;
  @HiveField(7)
  final String school;
   
  SomeData(
      {required this.correo,
      required this.firstname,
      required this.lastname,
      required this.birthday,
      required this.course,
      required this.password,
      required this.diff,
      required this.school});
}