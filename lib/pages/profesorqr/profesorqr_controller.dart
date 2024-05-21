import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfesorQRController extends GetxController {

  Rx<bool> mostrar = false.obs;
  Rx<String> qrData = ''.obs;

  void obtenerSeccionActual(){
    qrData.value = 'xd';
  }

  void generarQR(){
    obtenerSeccionActual();
    mostrar.value = true;
  }

  void ocultarQR(){
    mostrar.value = false;
  }

  void aceptarPopup(BuildContext context){
    generarQR();
    Navigator.of(context).pop();
  }

}
