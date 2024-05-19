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

  List<Usuario> usuarios = Usuario.lista;

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
    
    //se agrego una condicional con el fin de identificar al profesor

    if (found) {
      if(userLogged.id==0){
        print('usuario correcto');
        message.value = 'Usuario Profesor';
        messageColor.value = Colors.green;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    usuarioLogged: userLogged,
                  )),
        );

      }else{
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
      }
      
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
