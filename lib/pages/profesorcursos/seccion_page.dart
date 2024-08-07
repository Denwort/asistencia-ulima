import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/CursoProfe.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/profesorcursos/seccion_controller.dart';

class ProfesorCursosPage extends StatefulWidget {
  final Usuario usuario;
  ProfesorCursosPage({required this.usuario});

  @override
  _ProfesorCursosPageState createState() => _ProfesorCursosPageState();
}

class _ProfesorCursosPageState extends State<ProfesorCursosPage> {
  late ProfesorCursosController control;

  @override
  void initState() {
    super.initState();
    control = Get.put(ProfesorCursosController(widget.usuario));
  }

  @override
  void dispose() {
    Get.delete<ProfesorCursosController>();
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

  List<Widget> _generarCursos(BuildContext context, List<CursoProfe> cursos) {
    List<Widget> cursosWidgets = [];
    for (var curso in cursos) {
      cursosWidgets.add(
        InkWell(
          onTap: () {
            control.redireccionrAFechas(context, curso.seccId, widget.usuario);
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
                    'Sección: ${curso.seccionCodigo}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
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
