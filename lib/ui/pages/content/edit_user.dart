import 'package:app_oper/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  User user = Get.arguments[0];
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerColegio = TextEditingController();
  final controllerFn = TextEditingController();
  final controllerGrado = TextEditingController();
  final controllerDifficult = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    controllerFirstName.text = user.firstname;
    controllerLastName.text = user.lastname;
    controllerEmail.text = user.email;
    controllerColegio.text = user.school;
    controllerFn.text = user.birthday;
    controllerGrado.text = user.course;
    controllerDifficult.text = user.diff;
    controllerPassword.text = user.password;
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.firstname} ${user.lastname}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerFirstName,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerLastName,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerColegio,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Colegio',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerFn,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'fecha de nacimiento',
                )),
            const SizedBox(
              height: 20,
            ),
             TextField(
                controller: controllerDifficult,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'dificultad',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerPassword,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'contraseña',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerGrado,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'grado',
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            await userController.updateUser(User(
                                id: user.id,
                                email: controllerEmail.text,
                                firstname: controllerFirstName.text,
                                lastname: controllerLastName.text,
                                school: controllerColegio.text,
                                birthday: controllerFn.text,
                                diff: controllerDifficult.text,
                                password: controllerPassword.text,
                                course: controllerGrado.text,

                                ));
                            Get.back();
                          },
                          child: const Text("Update")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
