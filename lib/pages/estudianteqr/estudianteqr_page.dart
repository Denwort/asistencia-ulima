import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import './estudianteqr_controller.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:get/get.dart';

class EstudianteQRPage extends StatelessWidget {
  final Usuario usuario;

  EstudianteQRPage({required this.usuario});
  EstudianteQRController control = Get.put(EstudianteQRController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escanear QR')),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: GetBuilder<EstudianteQRController>(
              builder: (controller) => QRView(
                key: controller.qrKey,
                onQRViewCreated: controller.initController,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GetBuilder<EstudianteQRController>(
                builder: (controller) {
                  if (controller.qrText.value != null &&
                      controller.qrText.value.isNotEmpty) {

                    return controller.getAsistencia(
                        controller.qrText.value, usuario);
                  } else {
                    return Text('Escanea un código QR');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

}
