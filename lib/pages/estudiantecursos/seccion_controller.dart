import 'package:get/get.dart';
import 'package:ulimagym/models/entities/CursoAlum.dart'; // Asegúrate de importar CursoAlum
import 'package:ulimagym/models/entities/Matricula.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import '../fechasAlumnon/fechasAlumno_page.dart';
import '../../services/cursos_service.dart';

class EstudianteCursosController extends GetxController {
  final Usuario usuario;
  final CursoService cursoService = CursoService(); // Instancia del servicio

  RxList<CursoAlum> cursos = <CursoAlum>[].obs;
  var isLoading = true.obs;

  EstudianteCursosController(this.usuario) {
    obtenerCursos();
  }


  void redireccionarAFechas(BuildContext context, int seccionId, int usuarioId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FechasAlumnoPageN(seccionId: seccionId, usuarioId: usuarioId)),
    );
  }

  void obtenerCursos() async {
    try {
      isLoading(true);
      List<CursoAlum>? cursosObtenidos = await cursoService.obtenerCursosPorAlumno(usuario.id);
      if(cursosObtenidos == null){
        print('Hubo un error en traer los datos del servidor');
      } else if(cursosObtenidos.isEmpty){
        print('No hay datos en la respuesta');
      } else{
        this.cursos.value = cursosObtenidos;
      }
      
    } catch (e) {
      print("Error al obtener cursos: $e");
    } finally {
      isLoading(false);
    }
  }
  

}
