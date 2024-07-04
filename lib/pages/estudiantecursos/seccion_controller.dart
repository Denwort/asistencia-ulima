import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Curso2.dart'; // Asegúrate de importar Curso2
import 'package:ulimagym/models/entities/Matricula.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import '../fechasAlumnon/fechasAlumno_page.dart';
import '../../services/cursos_service.dart';

class EstudianteCursosController extends GetxController {
  final Usuario usuario;
  final CursoService cursoService = CursoService(); // Instancia del servicio

  RxList<Curso2> cursos = <Curso2>[].obs;
  var isLoading = true.obs;

  EstudianteCursosController(this.usuario) {
    obtenerCursos();
  }


  void redireccionarAFechas(BuildContext context, Seccion seccion, Usuario usuario) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FechasAlumnoPageN(seccion: seccion, usuario: usuario)),
    );
  }
  
  List<Seccion> getSecciones(Usuario usuario) {
    List<Matricula> matriculas = Matricula.lista.where((element) => (element.alumno.id == usuario.id)).toList();
    List<Seccion> secciones = matriculas.map((e) => e.seccion).toList();
    return secciones;
  }

  

  void obtenerCursos() async {
    try {
      isLoading(true);
      List<Curso2>? cursosObtenidos = await cursoService.obtenerCursosPorAlumno(usuario.id);
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
