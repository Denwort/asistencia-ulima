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

  List<Seccion> secciones = [
    Seccion(
      id: 1,
      codigo: '830',
      periodo: '2024-1',
      curso: 'Programacion movil',
      profesor: 'Pepe Valdivia',
    ),
    Seccion(
      id: 1,
      codigo: '833',
      periodo: '2024-1',
      curso: 'Sistemas ERP',
      profesor: 'Pedro castillo',
    ),
    Seccion(
      id: 1,
      codigo: '830',
      periodo: '2024-1',
      curso: 'Gestion de riesgos',
      profesor: 'Jony Casma',
    ),
    Seccion(
      id: 1,
      codigo: '720',
      periodo: '2024-1',
      curso: 'TPI',
      profesor: 'Pepe Arroyo',
    ),
    Seccion(
      id: 1,
      codigo: '830',
      periodo: '2024-1',
      curso: 'Algoritmos silenciosos',
      profesor: 'Soraida Parra',
    ),
    Seccion(
      id: 1,
      codigo: '830',
      periodo: '2024-1',
      curso: 'Evaluacion de proyectos',
      profesor: 'Matuki',
    ),
  ];
}
