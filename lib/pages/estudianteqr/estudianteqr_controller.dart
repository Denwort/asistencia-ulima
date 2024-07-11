import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ulimagym/services/qr_service.dart';

class EstudianteQRController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  var qrText = ''.obs;
  var texto = ''.obs;
  Completer<String> qrCompleter = Completer<String>();
  QRService qrservice = new QRService();

  Future<void> initController(QRViewController controller) async {
    this.controller = controller;
    qrText.value = '';
    controller.scannedDataStream.listen((scanData) {
      qrText.value = scanData.code ?? '';
      print('QR escaneado: ${qrText.value}');
      if (!qrCompleter.isCompleted) {
        qrCompleter.complete(qrText.value);
      }
    });
  }

  Future<String> waitForQRCode() {
    qrCompleter = Completer<String>(); // Reset the completer
    return qrCompleter.future;
  }

  void getAsistencia(String sesion_id, Usuario usuario) async {

    int? sesion_id_int = int.tryParse(sesion_id);
    
    if(sesion_id_int == null){
      texto.value = 'QR invalido';
      return;
    }

    Asistencia? asistencia = await qrservice.obtenerQRAsistenciaAlumno(sesion_id_int, usuario.id);

    print(asistencia);

    texto.value = 'Has marcado tu asistencia correctamente' + //asistencia[0].session.seccion_id.toString() + 
      ' para el dia ' + asistencia.sesion.fechaInicio.day.toString()+
      '-' +  asistencia.sesion.fechaInicio.month.toString()+
      '-' + asistencia.sesion.fechaInicio.year.toString();
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