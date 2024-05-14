import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'acercade_controller.dart';

class AcercadePage extends StatelessWidget {
  AcercadeController control = Get.put(AcercadeController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'), // Aquí puedes colocar tu logo
            ),
            SizedBox(height: 20),
            Text(
              'Asistencia Ulima',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Versión 1.0.0',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenido a nuestra aplicación de marcación de asistencia para la Universidad de Lima. Registra la asistencia de estudiantes y profesores de manera rápida y sencilla. Gestiona tus clases y accede a informes detallados sobre la asistencia. Simplifica la gestión de la asistencia en la Universidad de Lima con nuestra aplicación.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    ));
  }
}
