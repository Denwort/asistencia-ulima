import 'package:get/get.dart';
import 'package:ulimagym/models/entities/AsistenciaQR.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ulimagym/services/qr_service.dart';

class EstudianteQRController extends GetxController {
  //qr
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  var qrText = ''.obs;
  var texto = ''.obs;
  Completer<String> qrCompleter = Completer<String>();

  //api
  QRService qrservice = new QRService();

  //camara
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

  //api
  void getAsistencia(String sesion_id, Usuario usuario) async {

    int? sesion_id_int = int.tryParse(sesion_id);
    
    if(sesion_id_int == null){
      texto.value = 'QR invalido';
      return;
    }

    AsistenciaQR? asistencia = await qrservice.obtenerQRAsistenciaAlumno(sesion_id_int, usuario.id);

    if(asistencia!=null){
      texto.value = "Has marcado tu asistencia para" + asistencia.sesion.curso + 
      ' del dia ' + asistencia.sesion.fechaInicio.day.toString() +
      '/' + asistencia.sesion.fechaInicio.month.toString() + 
      '/' + asistencia.sesion.fechaInicio.year.toString() + 
      ' con horario ' + asistencia.sesion.fechaInicio.hour.toString()+
      ':' + asistencia.sesion.fechaInicio.minute.toString().padLeft(2, '0')+
      '-' + asistencia.sesion.fechaFin.hour.toString()+
      ':' + asistencia.sesion.fechaFin.minute.toString().padLeft(2, '0');
    }
    else{
      texto.value = 'Error marcando asistencia';
    }

  }


}