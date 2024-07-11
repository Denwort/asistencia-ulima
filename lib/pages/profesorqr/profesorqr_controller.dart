import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/services/qr_service.dart';

class ProfesorQRController extends GetxController {

  Rx<bool> mostrar = false.obs;
  Rx<String> qrData = ''.obs;

  QRService qrservice = new QRService();

  void generarQR(int usuario_id) async {
    Sesion? sesion = await qrservice.obtenerQRSesionProfesor(usuario_id);
    qrData.value = sesion.id.toString();
    mostrar.value = true;
  }

  void ocultarQR(){
    mostrar.value = false;
  }

  void aceptarPopup(BuildContext context, int usuario_id){
    generarQR(usuario_id);
    Navigator.of(context).pop();
  }

}
