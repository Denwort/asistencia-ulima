import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/pages/login/login_page.dart';
import 'package:ulimagym/pages/signin/signin_page.dart';
import 'recover_controller.dart';

class RecoverPage extends StatelessWidget {
  RecoverController control = Get.put(RecoverController());

  Widget _form(BuildContext context, bool isKeyBoardOpen) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0XFF999999), width: 2.0),
          color: Colors.white),
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.1, // Margen izquierdo
        MediaQuery.of(context).size.width *
            (isKeyBoardOpen ? 0.3 : 0.9), // Margen superior
        MediaQuery.of(context).size.width * 0.1, // Margen derecho
        MediaQuery.of(context).size.width * 0.1, // Margen inferior
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          /*Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/0e/ULIMA_logo.png', // URL de la imagen
            width: 40, // Ancho de la imagen
            height: 40, // Alto de la imagen
            fit: BoxFit.cover, // Ajuste de la imagen
          ),*/
          Text('Olvidó su Contraseña?'),
          SizedBox(
            height: 10,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'DNI', // Etiqueta del campo de texto
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.zero), // Borde del campo de texto
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Color del borde al enfocar
                ),
              ),
              controller: control.dniController,
            ),
            SizedBox(
              height: 6,
            ),
            TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Correo', // Etiqueta del campo de texto
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.zero), // Borde del campo de texto
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Color del borde al enfocar
                ),
              ),
              controller: control.emailController,
            ),
            SizedBox(
              width: double.infinity, // Ocupar todo el ancho disponible
              child: TextButton(
                onPressed: () {
                  // Función que se ejecuta cuando se presiona el botón
                  control.resetPassword();
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Color(0XFFF26F29), // Color de fondo del botón
                  padding: EdgeInsets
                      .zero, // Padding cero para eliminar el espacio interno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius
                        .zero, // Bordes cero para eliminar los bordes
                  ),
                ),
                child: Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    color: Colors.white, // Color del texto
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Obx(() => Text(
                  control.message.value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: control.messageColor.value,
                  ),
                )),
            _links(context)
          ])
        ],
      ),
    );
  }

  Widget _links(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('clicked Ingresar');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Ingresar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFF26F29),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  'Crear Cuenta',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFF26F29),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget _background(BuildContext context) {
    return Container(color: Color(0XFFF2F2F2));
  }

  Widget _imageBackground(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                      fit: BoxFit.cover)),
            ),
            flex: 1),
        Expanded(child: Text(''), flex: 1),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final bool isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    print('1 +++++++++++++++++++++++++');
    print(isKeyBoardOpen);
    print('2 +++++++++++++++++++++++++');
    return Stack(children: [
      _background(context),
      _imageBackground(context),
      _form(context, isKeyBoardOpen)
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: _buildBody(context)),
    );
  }
}
