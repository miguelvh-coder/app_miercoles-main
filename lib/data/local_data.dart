import '../data/data_remote/models/some_data_db.dart';
import 'package:app_oper/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../ui/controllers/person_controller.dart';

class LocalDataSource {
    PersonController perController = Get.find();

  Future<void> addElement(User entry) async {
    Hive.box('user').add(SomeData(
        firstName: entry.firstName,
        lastName: entry.lastName,
        correo: entry.email,
        school: entry.colegio,
        course: entry.grado,
        birthday: entry.fN,
        password: entry.password,
        difficult: entry.difficult));
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
      firstName: e.firstName,
      lastName: e.lastName,
      email: e.correo,
      colegio: e.school,
      grado: e.course,
      fN: e.birthday,
      password: e.password,
      difficult: e.difficult,
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
        firstName: perController.firstName.value,
        lastName: perController.lastName.value,
        email: perController.email.value,
        colegio: perController.school.value,
        grado: perController.course.value,
        fN: perController.birthday.value,
        password: perController.password.value,
        difficult: perController.difficult.value.toString(),));
  }
}