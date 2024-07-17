import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'profesorqr_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfesorQRPage extends StatefulWidget {
  final Usuario usuario;
  ProfesorQRPage({required this.usuario});

  @override
  _ProfesorQRPage createState() => _ProfesorQRPage();
}


class _ProfesorQRPage extends State<ProfesorQRPage> {
  late ProfesorQRController control;

  @override
  void initState() {
    super.initState();
    control = Get.put(ProfesorQRController(widget.usuario));
  }

  @override
  void dispose() {
    Get.delete<ProfesorQRController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBodyOrLoading(context),
    );
  }

  Widget _buildBodyOrLoading(BuildContext context) {
    return Obx(() {
      if (control.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return _buildBody(context);
      }
    });
  }


  Widget _qrImagen() {
    return Obx(() {
      if (control.mostrarQR.value) {
        return Center(
          child: Column(
            children: [
              QrImageView(
                data: control.qrData.value,
                size: 280,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(
                    100,
                    100,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }


  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(()=>Text(
                control.texto.value,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(height: 0),
            Obx(() {
              if (control.mostrarGenerar.value) {
                return ElevatedButton(
                  onPressed: () {
                    control.registrar();
                    _showMessageDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange, // Color morado
                  ),
                  child: Text(
                    'Generar QR',
                    style: TextStyle(fontSize: 20,),
                  ),
                );
              }
              return Container();
            }),
            SizedBox(height: 30),
            Container(
              child: _qrImagen(),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Codigo QR generado'),
          content: Text('El QR ha sido enviado a su correo. Proyectelo en la pizarra para que los alumnos lo escaneen.', ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                control.aceptarPopup(context);
              },
              child: Text('Continuar', style: TextStyle(color: Colors.orange),),
            ),
          ],
        );
      },
    );
  }


}
