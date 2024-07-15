// lib/pages/estudiantecursos/seccion_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/CursoAlum.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'seccion_controller.dart';

class EstudianteCursosPage extends StatefulWidget {
  final Usuario usuario;
  EstudianteCursosPage({required this.usuario});

  @override
  _EstudianteCursosPageState createState() => _EstudianteCursosPageState();
}

class _EstudianteCursosPageState extends State<EstudianteCursosPage> {
  late EstudianteCursosController control;

  @override
  void initState() {
    super.initState();
    control = Get.put(EstudianteCursosController(widget.usuario));
  }

  @override
  void dispose() {
    Get.delete<EstudianteCursosController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

  List<Widget> _generarCursos(BuildContext context, List<CursoAlum> cursos) {
    List<Widget> cursosWidgets = [];

    for (var curso in cursos) {
      cursosWidgets.add(
        InkWell(
          onTap: () {
            control.redireccionarAFechas(context, curso.seccId, widget.usuario.id);
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
