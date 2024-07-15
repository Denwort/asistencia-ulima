import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/AsistenciasProfe.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/SesionProfe.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import '../../services/listadoAlumnos_service.dart';

class ProfesorListadoAlumnosController extends GetxController {
  final int sesionId;
  final ListadoalumnosService asistenciasService = ListadoalumnosService(); // Instancia del servicio

  RxList<AsistenciaProfe> asistencias = <AsistenciaProfe>[].obs;
  var isLoading = true.obs;

  ProfesorListadoAlumnosController({required this.sesionId}) {
    obtenerAsistencias();
  }

  void obtenerAsistencias() async {
    try {
      isLoading(true);
      List<AsistenciaProfe>? asistenciasObtenidas = await asistenciasService.obtenerAsistenciasProfesor(sesionId);
      if (asistenciasObtenidas == null) {
        print('Hubo un error en traer los datos del servidor');
      } else if (asistenciasObtenidas.isEmpty) {
        print('No hay datos en la respuesta');
      } else {
        this.asistencias.value = asistenciasObtenidas;
      }
    } catch (e) {
      print("Error al obtener sesiones: $e");
    } finally {
      isLoading(false);
    }
  }
  void modificarAsistencia(int asistenciaId, bool asistio) async {
    try {
      bool result = await asistenciasService.modificarAsistencia(asistenciaId, asistio);
      if (result) {
        // Actualiza el valor de `asistio` en la lista local de asistencias
        AsistenciaProfe? asistencia = asistencias.firstWhereOrNull((a) => a.id == asistenciaId);
        if (asistencia != null) {
          asistencia.asistio.value = asistio;
        }
        print('Asistencia actualizada correctamente.');
      } else {
        print('Error al actualizar la asistencia.');
      }
    } catch (e) {
      print("Error al modificar asistencia: $e");
    }
  }
}