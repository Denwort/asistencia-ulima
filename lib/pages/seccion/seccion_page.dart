import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'seccion_controller.dart';
import '../../models/entities/BodyPart.dart';

class SeccionPage extends StatelessWidget {
  SeccionController control = Get.put(SeccionController());

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
                color: Color.fromARGB(244, 161, 231, 222),
                borderRadius: BorderRadius.circular(35),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Programación Móvil',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Profesor: Jose Jesus Valdivia Caballero',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Sección: 823',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (i < cantidad - 1)
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
                indent: 50,
                endIndent: 50,
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
