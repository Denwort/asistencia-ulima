import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Matricula.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/fechasAlumno/fechasAlumno_page.dart';

class ProfesorListadoAlumnosController extends GetxController {
  List<Usuario> getEstudiantes(Seccion seccion, Usuario usuario){
    List<Matricula> matriculas = Matricula.lista.where((element) => (element.seccion==seccion)).toList();
    List<Usuario> matriculados = matriculas.map((e) => e.alumno).toList();
    return matriculados;
  }

  void redireccionrAFechas(BuildContext context, Seccion seccion, Usuario usuario) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FechasAlumnoPage(seccion: seccion, usuario: usuario)),
    );
  }
  
}
