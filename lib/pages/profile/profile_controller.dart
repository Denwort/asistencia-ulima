import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import '../../services/profile_service.dart';

class ProfileController extends GetxController {
  final Usuario usuario;
  final ProfileService profileService = ProfileService(); // Instancia del servicio

  Rx<Usuario> perfil = Usuario.empty().obs;
  var isLoading = true.obs;

  ProfileController(this.usuario) {
    obtenerPerfil();
  }

  void obtenerPerfil() async {
    try {
      isLoading(true);
      Usuario perfilObtenido = await profileService.obtenerPerfil(usuario.id);
      perfil.value = perfilObtenido;
    } catch (e) {
      print("Error al obtener perfil: $e");
    } finally {
      isLoading(false);
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
