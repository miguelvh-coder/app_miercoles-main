import '../data/data_remote/models/some_data_db.dart';
import 'package:app_oper/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../ui/controllers/person_controller.dart';

class LocalDataSource {
    PersonController perController = Get.find();

  Future<void> addElement(User entry) async {
    Hive.box('user').add(SomeData(
        firstname: entry.firstname,
        lastname: entry.lastname,
        correo: entry.email,
        school: entry.school,
        course: entry.course,
        birthday: entry.birthday,
        password: entry.password,
        diff: entry.diff));
  }
  Future<bool> getUser(String email, String password) async {
    List<User> usuarios = await getAll();
    for (var i = 0; i < usuarios.length; i++) {
      if (usuarios[i].email == email && usuarios[i].password == password) {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
  //verificar que el correo no este registrado
  Future<bool> verifyUser(String email) async {
    List<User> usuarios = await getAll();
    for (var i = 0; i < usuarios.length; i++) {
      if (usuarios[i].email == email) {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
  Future<List<User>> getAll() async {
    return Hive.box('user').values.map((e) => User(
      id: e.key as int,
      firstname: e.firstname,
      lastname: e.lastname,
      email: e.correo,
      school: e.school,
      course: e.course,
      birthday: e.birthday,
      password: e.password,
      diff: e.diff,
    )).toList();
  }
  Future<void> deleteAll() async {
    Hive.box('user').clear();
  }
  Future<void> deleteEntry(User entry) async {
    Hive.box('user').deleteAt(entry.id!);
  }

  //actulizare la informacion del usuario apartir de playercontroller

  Future<void> updateEntry() async {
    Hive.box('user').put(perController.id, User(
        firstname: perController.firstname.value,
        lastname: perController.lastname.value,
        email: perController.email.value,
        school: perController.school.value,
        course: perController.course.value,
        birthday: perController.birthday.value,
        password: perController.password.value,
        diff: perController.diff.value.toString(),));
  }
}