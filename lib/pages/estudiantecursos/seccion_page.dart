import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'seccion_controller.dart';

class EstudianteCursosPage extends StatelessWidget {
  final Usuario usuario;
  EstudianteCursosPage({required this.usuario});

  EstudianteCursosController control = Get.put(EstudianteCursosController());

  Widget _buildBody(BuildContext context) {
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
              children: generarCursos(context ,control.getSecciones(usuario)),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generarCursos(BuildContext context, List<Seccion> secciones) {
    List<Widget> cursos = [];

    for (int i = 0; i < secciones.length; i++) {
      cursos.add(
        Column(
          children: [
            InkWell(
              onTap: () {
                control.redireccionrAFechas(context, secciones[i], usuario);
              },
              child: Container(
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
                        secciones[i].curso,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '${secciones[i].profesor.nombres} ${secciones[i].profesor.apellidos}',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Sección: ${secciones[i].codigo}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (i < secciones.length - 1)
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
      body: _buildBody(context),
    ));
  }
}
