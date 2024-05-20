import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'estudianteqr_controller.dart';

class EstudianteQRPage extends StatelessWidget {
  final Usuario usuario;
  EstudianteQRPage({required this.usuario});

  EstudianteQRController control = Get.put(EstudianteQRController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Leer QR'),
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
