import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'package:app_oper/ui/controllers/answer.dart';
import 'package:app_oper/ui/controllers/authentication_controller.dart';
import 'package:app_oper/ui/controllers/dificultad.dart';
import 'package:app_oper/ui/controllers/result_writer.dart';
import 'package:app_oper/ui/controllers/user_controller.dart';
import 'package:app_oper/ui/controllers/person_controller.dart';
import 'package:app_oper/ui/controllers/history_controller.dart';

import 'package:app_oper/ui/central.dart';
import 'package:app_oper/domain/use_case/user_case.dart';
import 'domain/repositories/repository.dart';
import 'domain/use_case/authentication_case.dart';
import 'package:app_oper/ui/controllers/progresion.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:app_oper/data/data_remote/models/some_data_db.dart';
import 'package:app_oper/data/data_remote/models/local_history.dart';


Future<List<Box>> _openBoxes() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(SomeDataAdapter());
  boxList.add(await Hive.openBox('user'));
  Hive.registerAdapter(LocalHistorialAdapter());
  boxList.add(await Hive.openBox('history'));
  return boxList;
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _openBoxes();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  Get.put(Resultwriter());
  Get.put(Dificultad());
  Get.put(Answer());
  Get.put(Progresion());
  Get.put(Repository());
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(AuthenticationController());
  Get.put(UserController());
  Get.put(HistoryController());
  Get.put(PersonController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'app_oper Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('app_oper Demo'),
          ),
          body: const Central(), //ir a la pagina de inicio
          //body: const UserListPage(), //ir a la pagina de inicio
        ));
  }
}

//LISTO