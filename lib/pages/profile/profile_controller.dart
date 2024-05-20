import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

class ProfileController extends GetxController {
  var usuario = Usuario.empty().obs;

  @override
  void onInit() {
    // Aquí puedes cargar los datos del usuario
    super.onInit();
  }

  void cargarUsuario(Usuario user) {
    usuario.value = user;
  }

  void cambiarContrasenia() {
    // Lógica para cambiar contraseña
  }

  void cerrarSesion() {
    // Lógica para cerrar sesión
  }
}
