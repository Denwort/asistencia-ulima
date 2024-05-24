import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import './estudianteqr_controller.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:get/get.dart';

class EstudianteQRPage extends StatelessWidget {
  final Usuario usuario;
  EstudianteQRPage({required this.usuario});
  final EstudianteQRController controller = Get.put(EstudianteQRController());

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
                onQRViewCreated: (controller) async {
                  await this.controller.initController(controller);
                  // Espera a que se escanee un código QR
                  String qrCode = await this.controller.waitForQRCode();
                  // Procesa el código QR escaneado
                  print('Código QR procesado: $qrCode');
                  this.controller.getAsistencia(qrCode, usuario);
                },
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Obx(() {
                if (controller.qrText.value.isNotEmpty) {
                  return Text(controller.texto.value, textAlign: TextAlign.center,);
                } else {
                  return Text('Escanea un código QR');
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}