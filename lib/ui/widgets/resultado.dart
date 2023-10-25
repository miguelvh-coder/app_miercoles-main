import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/result_writer.dart';

class Resultado extends StatelessWidget {
  const Resultado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Resultwriter controller = Get.find();

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
                20.0), // Ajusta el espacio alrededor del texto
            child: Obx(() {
              final inputText = controller.result.toString();
              final intValue = int.tryParse(
                  inputText); // Intenta convertir el texto en un int

              return Text(
                intValue != null
                    ? intValue.toString()
                    : 'Ingrese un número válido', // Muestra el int convertido o un mensaje de error
                style: TextStyle(
                    fontSize: 24.0), // Ajusta el tamaño de la fuente del texto
              );
            }),
          ),
        ],
      ),
    );
  }
}

//LISTO