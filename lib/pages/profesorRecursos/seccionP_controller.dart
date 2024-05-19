import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:flutter/material.dart';
import '../fechasAlumno/fechasAlumno_page.dart';


class ProfesorCursosController extends GetxController {

void redireccionrAFechas(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FechasAlumnoPage()),
    );
  }

  List<Seccion> secciones = Seccion.lista;
}
