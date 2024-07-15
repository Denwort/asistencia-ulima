import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulimagym/pages/profesorcursos/seccion_controller.dart';

class ProfileController extends GetxController {
  var usuario = Usuario.empty().obs;

  // Simula la carga de datos del usuario (puedes adaptar esto para usar una API real)
  void cargarUsuario(int id) {
    Usuario? user = Usuario.lista.firstWhere((u) => u.id == id, orElse: () => Usuario.empty());
    if (user != null) {
      usuario.value = user;
    }
  }

  void cambiarContrasenia() {
    // Implementa la lógica para cambiar la contraseña
    print("Cambiando contraseña");
  }

  void cerrarSesion() {
    // Limpiar datos del controlador de cursos antes de cerrar sesión
    Get.reset();
  }
}
