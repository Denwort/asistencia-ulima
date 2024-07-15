import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'profile_controller.dart';
import 'package:ulimagym/pages/login/login_page.dart';

class ProfilePage extends StatefulWidget {
  final Usuario usuario;
  ProfilePage({required this.usuario});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileController control;

  @override
  void initState() {
    super.initState();
    control = Get.put(ProfileController(widget.usuario));
  }

  @override
  void dispose() {
    Get.delete<ProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(() {
          if (control.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (control.perfil.value.id == 0) {
            return Center(child: Text('No hay datos disponibles'));
          }

          Usuario usuario = control.perfil.value;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    usuario.rol == 'profesor' ? 'Perfil del Profesor' : 'Perfil del Alumno',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                    usuario.rol,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 60),
                Align(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.6, // 60% del ancho del contenedor padre
                    child: TextButton(
                      onPressed: () {
                        control.cerrarSesion();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0XFFF26F29), // Color de fondo del botón
                        padding: EdgeInsets.zero, // Padding cero para eliminar el espacio interno
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Bordes cero para eliminar los bordes
                        ),
                      ),
                      child: Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          color: Colors.white, // Color del texto
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
