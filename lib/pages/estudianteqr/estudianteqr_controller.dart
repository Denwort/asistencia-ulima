import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';

class EstudianteQRController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  var qrText = ''.obs;

  void initController(QRViewController controller) {
  this.controller = controller;
  controller.scannedDataStream.listen((scanData) {
    print('**********************************');//no llega nunca a este print respondemos? tas?
    print('QR Code scanned: ${scanData.code}');
    print('**********************************');
    qrText.value = scanData.code ?? '';
  });
}

  Text getAsistencia(String sesion_id, Usuario usuario) {

    List<Asistencia> asistencia = Asistencia.lista
        .where((element) => 
            (element.session.id == int.parse(sesion_id)) && (element.alumno.id == usuario.id))
        .toList();
    print(asistencia);
    if (asistencia.isNotEmpty) {
      asistencia[0].asistio=true.obs;
      return Text('Asistencia registrada');
    }else{
      return Text('No se ha encontrado tu usuarion en esta sesion');
    }

  }

  void pauseCamera() {
    controller?.pauseCamera();
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}