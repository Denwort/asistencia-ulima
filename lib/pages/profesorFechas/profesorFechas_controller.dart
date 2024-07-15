import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/SesionProfe.dart';
import '../../services/profesorFechas_service.dart';

class ProfesorFechas_controller extends GetxController {
  final int seccionId;
  final ProfesorFechasService asistenciasService = ProfesorFechasService(); // Instancia del servicio

  RxList<SesionProfe> sesiones = <SesionProfe>[].obs;
  var isLoading = true.obs;

  ProfesorFechas_controller({required this.seccionId}) {
    obtenerSesiones();
  }

  void obtenerSesiones() async {
    try {
      isLoading(true);
      List<SesionProfe>? sesionesObtenidas = await asistenciasService.obtenerSesionesProfesor(seccionId);
      if (sesionesObtenidas == null) {
        print('Hubo un error en traer los datos del servidor');
      } else if (sesionesObtenidas.isEmpty) {
        print('No hay datos en la respuesta');
      } else {
        this.sesiones.value = sesionesObtenidas;
      }
    } catch (e) {
      print("Error al obtener sesiones: $e");
    } finally {
      isLoading(false);
    }
    /*void redireccionrAListadoAlumnos(BuildContext context, int sesion_id, int usuario_id) {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfesorListadoAlumnos(sesion_id: sesion_id, ususuario_id: usuario_id,)),
    );
    }*/
  }
}
