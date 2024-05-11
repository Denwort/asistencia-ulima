import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ulimagym/pages/login/login_page.dart';
import 'package:ulimagym/pages/recover/recover_page.dart';
import 'signin_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 2,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Términos y Condiciones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Markdown(
                    data: control.markdownData.value,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              flex: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  control.aceptTerms(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35),
                                  backgroundColor: Color(0XFFF26F29),
                                ),
                                child: Text(
                                  'Acepto',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              )),
                          Expanded(flex: 10, child: SizedBox(height: 0)),
                          Expanded(
                              flex: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  control.declineTerms(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35),
                                  backgroundColor: Color(0XFFF26F29),
                                ),
                                child: Text(
                                  'No Acepto',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _form(BuildContext context, bool isKeyBoardOpen) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0XFF999999), width: 2.0),
          color: Colors.white),
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.1, // Margen izquierdo
        MediaQuery.of(context).size.width *
            (isKeyBoardOpen ? 0.3 : 0.9), // Margen superior
        MediaQuery.of(context).size.width * 0.1, // Margen derecho
        MediaQuery.of(context).size.width * 0.2, // Margen inferior
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
          Text('Crear Cuenta'),
          SizedBox(
            height: 10,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Obx(() => TextField(
                  enabled: control.termsCheck.value,
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
                )),
            Obx(() => TextField(
                  enabled: control.termsCheck.value,
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
                )),
            SizedBox(
              height: 6,
            ),
            Obx(() => TextField(
                  enabled: control.termsCheck.value,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Contraseña', // Etiqueta del campo de texto
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
                  controller: control.pass1Controller,
                  obscureText: true,
                )),
            Obx(() => TextField(
                  enabled: control.termsCheck.value,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText:
                        'Repita Contraseña', // Etiqueta del campo de texto
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
                    filled: true, // Habilita el fondo relleno
                    fillColor: control.termsCheck.value
                        ? Colors.white
                        : Color(0XFFF0F0F0),
                  ),
                  controller: control.pass2Controller,
                  obscureText: true,
                )),
            Obx(() => SizedBox(
                  width: double.infinity, // Ocupar todo el ancho disponible
                  child: TextButton(
                    onPressed: control.termsCheck.value
                        ? () {
                            // Aquí colocas el código que quieres que se ejecute cuando se presione el botón
                            control.createAccount();
                          }
                        : null,
                    style: TextButton.styleFrom(
                      backgroundColor: control.termsCheck.value
                          ? Color(0XFFF26F29)
                          : Colors.grey, // Color de fondo del botón
                      padding: EdgeInsets
                          .zero, // Padding cero para eliminar el espacio interno
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .zero, // Bordes cero para eliminar los bordes
                      ),
                    ),
                    child: Text(
                      'Generar Solicitud',
                      style: TextStyle(
                        color: control.termsCheck.value
                            ? Colors.white
                            : Colors.black, // Color del texto
                        fontSize: 14,
                      ),
                    ),
                  ),
                )),
            Obx(() => GestureDetector(
                onTap: () {
                  this._showBottomSheet(context);
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: control.termsCheck.value,
                      onChanged: (bool? value) {
                        this._showBottomSheet(context);
                      },
                    ),
                    Text('Acepto Términos y Condiciones'),
                  ],
                ))),
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
    ));
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
                  print('clicked Crear Cuenta');
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
                    MaterialPageRoute(builder: (context) => RecoverPage()),
                  );
                },
                child: Text(
                  'Recuperar Contraseña',
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
    return Stack(children: [
      _background(context),
      _imageBackground(context),
      _form(context, isKeyBoardOpen)
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    control.getTerms();
    return MaterialApp(
      home: Scaffold(body: _buildBody(context)),
    );
  }
}
