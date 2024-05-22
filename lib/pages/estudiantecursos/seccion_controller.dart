import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Matricula.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import '../fechasAlumnon/fechasAlumno_page.dart';


class EstudianteCursosController extends GetxController {

  void redireccionrAFechas(BuildContext context, Seccion seccion, Usuario usuario) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FechasAlumnoPageN(seccion: seccion, usuario: usuario)),
    );
  }

  List<Seccion> getSecciones(Usuario yo){
    List<Matricula> matriculas = Matricula.lista.where((element) => (element.alumno.id == yo.id)).toList();
    List<Seccion> secciones = matriculas.map((e) => e.seccion).toList();
    return secciones;
  }
  

}
