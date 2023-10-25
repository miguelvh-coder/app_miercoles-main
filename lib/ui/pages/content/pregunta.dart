import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/operacion.dart';
import '../../widgets/resultado.dart';
import '../../widgets/botones.dart';

import 'package:app_oper/ui/controllers/progresion.dart';
import 'package:app_oper/ui/controllers/result_writer.dart';
import 'package:app_oper/ui/controllers/answer.dart';
import 'package:app_oper/ui/controllers/dificultad.dart';
import 'package:app_oper/ui/pages/content/end_page.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

String minutos(int segu) {
  int minutos = segu ~/ 60;
  int segundos = segu % 60;
  String min = minutos.toString();
  String seg = segundos.toString();
  if (minutos < 10) {
    min = "0$minutos";
  }
  if (segundos < 10) {
    seg = "0$segundos";
  }
  return "$min:$seg";
}

class _CalculatorState extends State<Calculator> {
  Answer controller = Get.find();

  String input = "";
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    Dificultad controller = Get.find();
    Answer controller2 = Get.find();
    Resultwriter controller3 = Get.find();
    Progresion tempo = Get.find();

    //int dia = controller.difficultya;
    //int dib = controller.difficultyb;
    //controller2.generar_q(dia,dib);

    //tempo.reset();
    //tempo.empezar();

    List<List<String>> buttonGrid = [
      ["7", "8", "9"],
      ["4", "5", "6"],
      ["1", "2", "3"],
      ["C", "0", "go"],
    ];

    List<Widget> buttonRows = [];

    for (List<String> row in buttonGrid) {
      List<Widget> rowButtons = [];
      for (String buttonText in row) {
        rowButtons.add(botones(button: buttonText));
      }
      buttonRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowButtons,
      ));
    }
    if (controller3.actual() >= 6) {
      const Endpage();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora en flutter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //principal
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(
                  20.0), // Ajusta el espacio alrededor del texto
              child: Obx(() {
                final aa = (controller3.contador)
                    .toString(); // Intenta convertir el texto en un int

                return Text(
                  'Pregunta: $aa/6', // Muestra el int convertido o un mensaje de error
                  style: const TextStyle(
                      fontSize:
                          18.0), // Ajusta el tamaño de la fuente del texto
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  20.0), // Ajusta el espacio alrededor del texto
              child: Obx(() {
                final ta = minutos(
                    tempo.getTime()); // Intenta convertir el texto en un int

                return Text(
                  'Tiempo = $ta', // Muestra el int convertido o un mensaje de error
                  style: const TextStyle(
                      fontSize:
                          18.0), // Ajusta el tamaño de la fuente del texto
                );
              }),
            ),
          ]),
          const Operacion(),
          const Resultado(),
          Column(
            children: buttonRows,
          ),
        ],
      ),
    );
  }
}
