// lib/pages/estudiantecursos/seccion_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Curso2.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'seccion_controller.dart';

class EstudianteCursosPage extends StatelessWidget {
  final Usuario usuario;

  EstudianteCursosPage({required this.usuario});

  @override
  Widget build(BuildContext context) {
    final EstudianteCursosController control = Get.put(EstudianteCursosController(usuario));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 25),
                child: Text(
                  'Todos los cursos',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildCursosList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCursosList(BuildContext context) {
    final EstudianteCursosController control = Get.find<EstudianteCursosController>();

    return Obx(() {
      if (control.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _generarCursos(context, control.cursos.toList()),
        );
      }
    });
  }

  List<Widget> _generarCursos(BuildContext context, List<Curso2> cursos) {
    List<Widget> cursosWidgets = [];

    for (var curso in cursos) {
      cursosWidgets.add(
        InkWell(
          onTap: () {
            Get.find<EstudianteCursosController>().redireccionarAFechas(context, curso.seccId, usuario.id);
          },
          child: Container(
            width: 330,
            height: 90,
            decoration: BoxDecoration(
              color: Color(int.parse(curso.color)),
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
                    curso.cursoNombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '${curso.profesorNombres} ${curso.profesorApellidos}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Sección: ${curso.seccionCodigo}',
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
      );

      cursosWidgets.add(
        Divider(
          height: 20,
          thickness: 1,
          color: Colors.grey,
          indent: 50,
          endIndent: 50,
        ),
      );
    }

    return cursosWidgets;
  }
}
