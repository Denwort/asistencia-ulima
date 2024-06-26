import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/listadoAlumnos/listadoAlumnos_page.dart';
import 'package:ulimagym/pages/profesorFechas/profesorFechas_page.dart';
import '../fechasAlumno/fechasAlumno_page.dart';

class ProfesorCursosController extends GetxController {
  
  void redireccionrAFechas(BuildContext context, Seccion seccion, Usuario usuario) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => profesorFechas_page(seccion: seccion, usuario: usuario,)),
    );
  }

  List<Seccion> getSecciones(Usuario yo){
    List<Seccion> secciones = Seccion.lista.where((element) => (element.profesor.id==yo.id)).toList();
    return secciones;
  }
}
