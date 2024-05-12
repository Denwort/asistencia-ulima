import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routine_controller.dart';
import '../../models/entities/BodyPart.dart';

class RoutinePage extends StatelessWidget {
  RoutineController control = Get.put(RoutineController());

  Widget _buildBody(BuildContext context, int cantidadDeObjetos) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinear el texto a la izquierda
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 25), // Espaciado izquierdo y debajo del texto
              child: Text(
                'Todos los cursos',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20), // Espacio entre el texto y los cuadrados
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Centrar los cuadrados horizontalmente
              children: generarCursos(cantidadDeObjetos),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generarCursos(int cantidad) {
    List<Widget> cursos = [];

    for (int i = 0; i < cantidad; i++) {
      cursos.add(
        Column(
          children: [
            Container(
              width: 330,
              height: 90,
              decoration: BoxDecoration(
                color: Color.fromARGB(
                  244,
                  161,
                  231,
                  222,
                ), // Puedes cambiar el color aquí si deseas
                borderRadius: BorderRadius.circular(
                  35,
                ), // Radio de las esquinas
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ), // Espacio entre cuadrados
            ),
            if (i < cantidad - 1)
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
                indent: 50, // Espaciado izquierdo
                endIndent: 50, // Espaciado derecho
              ),
          ],
        ),
      );
    }

    return cursos;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context, 7),
    ));
  }
}
