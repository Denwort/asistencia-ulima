import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'profile_controller.dart';
import 'package:ulimagym/pages/login/login_page.dart';

class ProfilePage extends StatelessWidget {
  final Usuario usuario;
  ProfilePage({required this.usuario});

  final ProfileController control = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // Cargar los datos del usuario al inicializar la página
    control.cargarUsuario(usuario.id);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Obx(() {
          Usuario usuario = control.usuario.value;
          return Text(
            usuario.rol == 'profesor' ? 'Perfil del Profesor' : 'Perfil del Alumno',
          );
        }),
        backgroundColor: Color(0XFFF26F29),
      ),
      body: SafeArea(
        child: Obx(() {
          Usuario usuario = control.usuario.value;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      usuario.rol == 'profesor'
                          ? 'assets/images/profileprofesor.png'
                          : 'assets/images/profilealumno.png',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    '${usuario.nombres} ${usuario.apellidos}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    usuario.rol, // Mostramos el usuario
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    control.cambiarContrasenia();
                  },
                  child: Text('Cambiar Contraseña'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    control.cerrarSesion();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Cerrar Sesión'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
