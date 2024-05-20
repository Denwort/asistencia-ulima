import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'profesorqr_controller.dart';

class ProfesorQRPage extends StatelessWidget {
  final Usuario usuario;
  ProfesorQRPage({required this.usuario});
  ProfesorQRController control = Get.put(ProfesorQRController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Este es un generador de códigos QR. Ingrese el texto que desea codificar y presione el botón "Generar QR".',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showMessageDialog(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.orange, // Color morado
              ),
              child: Text(
                'Generar QR',
                style: TextStyle(fontSize: 20,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('El QR ha sido enviado a su correo'),
          content: Text('Proyectelo en la pizarra para que los alumnos lo escaneen', ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Continuar', style: TextStyle(color: Colors.orange),),
            ),
          ],
        );
      },
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
