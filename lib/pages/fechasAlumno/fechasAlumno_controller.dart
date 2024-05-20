import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

class FechasAlumnoController extends GetxController {
  List<Asistencia> getAsistencias(Seccion seccion, Usuario usuario){
    List<Sesion> sesiones = Sesion.lista.where((element) => (element.seccion == seccion)).toList();
    List<Asistencia> asistencias = Asistencia.lista.where((element) => (sesiones.contains(element.session)) && (element.alumno==usuario)).toList();
    return asistencias;
  }
  
}
