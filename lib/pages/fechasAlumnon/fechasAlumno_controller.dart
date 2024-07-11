import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

class FechasAlumnoControllerN extends GetxController {
  List<Asistencia> getAsistencias(Seccion seccion, Usuario usuario) {

    List<Sesion> sesiones = Sesion.lista
        .where((element) => (element.seccion_id == seccion.id))
        .toList();
        
    List<Asistencia> asistencias = Asistencia.lista
        .where((element) =>
            (sesiones.contains(element.sesion)) &&
            (element.alumno.id == usuario.id))
        .toList();

    print(sesiones);
    return asistencias;
  }
}
