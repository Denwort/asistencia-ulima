import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:ulimagym/pages/home/home_page.dart';
import '../../models/entities/Usuario.dart';
import '../recover/recover_page.dart';
import '../signin/signin_page.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxString message = 'primer mensaje'.obs;
  var messageColor = Colors.white.obs;

  List<Usuario> usuarios = [
    Usuario(
      id: 1,
      usuario: 'usuario1',
      contrasenia: 'contrasenia1',
      miembroId: 101,
    ),
    Usuario(
      id: 2,
      usuario: 'usuario2',
      contrasenia: 'contrasenia2',
      miembroId: 102,
    ),
    Usuario(
      id: 3,
      usuario: 'usuario3',
      contrasenia: 'contrasenia3',
      miembroId: 103,
    ),
    Usuario(
      id: 4,
      usuario: 'usuario4',
      contrasenia: 'contrasenia4',
      miembroId: 104,
    ),
    Usuario(
      id: 5,
      usuario: 'usuario5',
      contrasenia: 'contrasenia5',
      miembroId: 105,
    ),
    Usuario(
      id: 6,
      usuario: 'usuario6',
      contrasenia: 'contrasenia6',
      miembroId: 106,
    ),
    Usuario(
      id: 7,
      usuario: 'usuario7',
      contrasenia: 'contrasenia7',
      miembroId: 107,
    ),
    Usuario(
      id: 8,
      usuario: 'usuario8',
      contrasenia: 'contrasenia8',
      miembroId: 108,
    ),
    Usuario(
      id: 9,
      usuario: 'usuario9',
      contrasenia: 'contrasenia9',
      miembroId: 109,
    ),
    Usuario(
      id: 10,
      usuario: 'usuario10',
      contrasenia: 'contrasenia10',
      miembroId: 110,
    ),
  ];

  void login(BuildContext context) {
    print('hola desde el controlador');
    print(userController.text);
    print(passController.text);
    String user = userController.text;
    String password = passController.text;
    bool found = false;
    Usuario userLogged = Usuario.empty();
    for (Usuario u in this.usuarios) {
      print('1 ++++++++++++++++++++');
      print(user);
      print(password);
      print(u);
      if (u.usuario == user && u.contrasenia == password) {
        found = true;
        userLogged = u;
      }
    }
    if (found) {
      print('usuario correcto');
      message.value = 'Usuario correcto';
      messageColor.value = Colors.green;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  usuarioLogged: userLogged,
                )),
      );
    } else {
      print('error: usuario incorrecto');
      message.value = 'Usuario incorrecto';
      messageColor.value = Colors.red;
    }
    Future.delayed(Duration(seconds: 5), () {
      message.value = '';
    });
  }

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

  void goToRecover(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecoverPage()),
    );
  }
}
