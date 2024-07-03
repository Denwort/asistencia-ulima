import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class EstudianteQRController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  var qrText = ''.obs;
  var texto = ''.obs;
  Completer<String> qrCompleter = Completer<String>();

  Future<void> initController(QRViewController controller) async {
    this.controller = controller;
    qrText.value = '';
    controller.scannedDataStream.listen((scanData) {
      qrText.value = scanData.code ?? '';
      print('Código QR escaneado: ${qrText.value}');
      if (!qrCompleter.isCompleted) {
        qrCompleter.complete(qrText.value);
      }
    });
  }

  Future<String> waitForQRCode() {
    qrCompleter = Completer<String>(); // Reset the completer
    return qrCompleter.future;
  }

  void getAsistencia(String sesion_id, Usuario usuario) {

    List<Asistencia> asistencia = Asistencia.lista
        .where((element) => 
            (element.session.id == int.parse(sesion_id)) && (element.alumno.id == usuario.id))
        .toList();
    print(asistencia);
    if (asistencia.isNotEmpty) {
      asistencia[0].asistio=true.obs;
      texto.value = 'Has marcado tu asistencia de '+ asistencia[0].session.seccion.curso.nombre + 
      ' para el dia ' + asistencia[0].session.fechaInicio.day.toString()+
      '-' +  asistencia[0].session.fechaInicio.month.toString()+
      '-' + asistencia[0].session.fechaInicio.year.toString();
    }
  }

  void pauseCamera() {
    controller?.pauseCamera();
  }

  void resumeCamera() {
    controller?.resumeCamera();
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}