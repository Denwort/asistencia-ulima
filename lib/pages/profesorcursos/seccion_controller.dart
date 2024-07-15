import 'package:get/get.dart';
import 'package:ulimagym/models/entities/CursoProfe.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/listadoAlumnos/listadoAlumnos_page.dart';
import 'package:ulimagym/pages/profesorFechas/profesorFechas_page.dart';
import 'package:ulimagym/services/cursos_service.dart';
import '../fechasAlumno/fechasAlumno_page.dart';

class ProfesorCursosController extends GetxController {
  final Usuario usuario;
  final CursoService cursoService = CursoService(); // Instancia del servicio

  RxList<CursoProfe> cursos = <CursoProfe>[].obs;
  var isLoading = true.obs;

  ProfesorCursosController(this.usuario) {
    obtenerCursos();
  }
  
  void redireccionrAFechas(BuildContext context, Seccion seccion, Usuario usuario) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => profesorFechas_page(seccion: seccion, usuario: usuario)),
    );
  }

  void obtenerCursos() async {
    try {
      isLoading(true);
      List<CursoProfe>? cursosObtenidos = await cursoService.obtenerCursosPorProfe(usuario.id);

      if(cursosObtenidos == null || cursosObtenidos.isEmpty) {
        print('No hay datos en la respuesta');
      } else {
        cursos.value = cursosObtenidos;
      }
      
    } catch (e) {
      print("Error al obtener cursos: $e");
    } finally {
      isLoading(false);
    }
  }

  void limpiarDatos() {
    isLoading(false);
  }
}
