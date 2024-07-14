import 'package:get/get.dart';
import 'package:ulimagym/models/entities/SesionAlum.dart';
import '../../services/AsistenciasAlumno_service.dart';

class FechasAlumnoControllerN extends GetxController {
  final int usuarioId;
  final int seccionId;
  final AsistenciasAlumnoService asistenciasService = AsistenciasAlumnoService(); // Instancia del servicio

  RxList<SesionAlum> sesiones = <SesionAlum>[].obs;
  var isLoading = true.obs;

  FechasAlumnoControllerN({required this.usuarioId, required this.seccionId}) {
    obtenerSesiones();
  }

  void obtenerSesiones() async {
    try {
      isLoading(true);
      List<SesionAlum>? sesionesObtenidas = await asistenciasService.obtenerSesionesPorAlumno(usuarioId, seccionId);
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
  }
}
