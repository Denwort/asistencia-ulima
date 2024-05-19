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
      id: 0,
      usuario: 'Profesor',
      contrasenia: 'Profesor',
      nombres: 'Odio',
      apellidos: 'Aqui',
    ),
    Usuario(
      id: 1,
      usuario: 'usuario1',
      contrasenia: 'contrasenia1',
      nombres: 'mateo',
      apellidos: 'alvarez',
    ),
    Usuario(
      id: 2,
      usuario: 'usuario2',
      contrasenia: 'contrasenia2',
      nombres: 'renzo',
      apellidos: 'mogollones',
    ),
    Usuario(
      id: 3,
      usuario: 'usuario3',
      contrasenia: 'contrasenia3',
      nombres: 'rick',
      apellidos: 'larry',
    ),
    Usuario(
      id: 4,
      usuario: 'usuario4',
      contrasenia: 'contrasenia4',
      nombres: 'fabricio',
      apellidos: 'melchor',
    ),
    Usuario(
      id: 5,
      usuario: 'usuario5',
      contrasenia: 'contrasenia5',
      nombres: 'david',
      apellidos: 'montes',
    ),
    Usuario(
      id: 6,
      usuario: 'usuario6',
      contrasenia: 'contrasenia6',
      nombres: 'piero',
      apellidos: 'rosales',
    ),
    Usuario(
      id: 7,
      usuario: 'usuario7',
      contrasenia: 'contrasenia7',
      nombres: 'sac',
      apellidos: 'mendez',
    ),
    Usuario(
      id: 8,
      usuario: 'usuario8',
      contrasenia: 'contrasenia8',
      nombres: 'piero',
      apellidos: 'montalvan',
    ),
    Usuario(
      id: 9,
      usuario: 'usuario9',
      contrasenia: 'contrasenia9',
      nombres: 'rick',
      apellidos: 'cod',
    ),
    Usuario(
      id: 10,
      usuario: 'usuario10',
      contrasenia: 'contrasenia10',
      nombres: 'richi',
      apellidos: 'lopez',
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
