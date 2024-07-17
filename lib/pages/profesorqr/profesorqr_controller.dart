import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ulimagym/models/entities/SesionQR.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/services/qr_service.dart';

class ProfesorQRController extends GetxController {
  final Usuario usuario;
  final QRService qrservice = QRService();
  var isLoading = true.obs;

  RxString texto = ''.obs;
  Rx<bool> mostrarGenerar = false.obs;
  Rx<bool> mostrarQR = false.obs;
  Rx<String> qrData = ''.obs;

  // constructor
  ProfesorQRController(this.usuario) {
    obtener();
  }

  // obtener el curso que dicta actualmente
  void obtener() async {
    try {
      isLoading(true);
      SesionQR? sesion = await qrservice.obtenerQRSesionProfesor(usuario.id);
      if (sesion!=null){
        actualizarInformacionDeSesion(sesion);
      }
      else {
        sinSesionActual(); 
      }
    } catch (e) {
      print("Error al obtener perfil: $e");
    } finally {
      isLoading(false);
    }
  }

  void registrar() async {
    try {
      SesionQR? sesion = await qrservice.registrarQRSesionProfesor(usuario.id);
      if (sesion!=null){
        actualizarInformacionDeSesion(sesion);
      }
      else {
        sinSesionActual(); 
      }
    } catch (e) {
      print("Error al obtener perfil: $e");
    }
  }

  void actualizarInformacionDeSesion(SesionQR sesion){
    texto.value = "Actualmente dictando " + sesion.curso + 
      ' en el dia ' + sesion.fechaInicio.day.toString() +
      '/' + sesion.fechaInicio.month.toString() + 
      '/' + sesion.fechaInicio.year.toString() + 
      ' con horario ' + sesion.fechaInicio.hour.toString()+
      ':' + sesion.fechaInicio.minute.toString().padLeft(2, '0')+
      '-' + sesion.fechaFin.hour.toString()+
      ':' + sesion.fechaFin.minute.toString().padLeft(2, '0');
    // si ya ha generado el qr anteriormente, mostrar el qr de frente
    if(sesion.registro == true){
      mostrarGenerar.value = false;
      qrData.value = sesion.id.toString();
      mostrarQR.value=true;
    }
    else {
      mostrarGenerar.value = true;
    }
  }

  void sinSesionActual(){
    texto.value = 'Ningun curso dictando actualmente';
    mostrarGenerar.value = false;
  }


  void aceptarPopup(BuildContext context){
    Navigator.of(context).pop();
  }

}
