import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/pages/listadoAlumnos/listadoAlumnos_page.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

class profesorFechas_controller extends GetxController {
  List<Asistencia> getAsistencias(Seccion seccion) {
    List<Sesion> sesiones = Sesion.lista
        .where((element) => (element.seccion.id == seccion.id))
        .toList();
    List<Asistencia> asistencias = Asistencia.lista
        .where((element) => (sesiones.contains(element.session)))
        .toList();
    return asistencias;
  }

  void redireccionrAListadoAlumnos(BuildContext context, Seccion seccion, Usuario usuario) {
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfesorListadoAlumnos(seccion: seccion, usuario: usuario,)),
    );
  }
}
