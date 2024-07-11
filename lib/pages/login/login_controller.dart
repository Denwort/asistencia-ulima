import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:ulimagym/pages/home/home_page.dart';
import '../../models/entities/Usuario.dart';
import '../recover/recover_page.dart';
import 'package:ulimagym/services/login_service.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxString message = ''.obs;
  var messageColor = Colors.white.obs;

  Future<void> login(BuildContext context) async {
    String user = userController.text;
    String password = passController.text;

     try {
      Usuario userLogged = await LoginService().login(user, password);
      print('usuario correcto');
      message.value = 'Usuario correcto';
      messageColor.value = Colors.green;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(usuarioLogged: userLogged),
        ),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('error: usuario incorrecto');
      message.value = 'Usuario incorrecto';
      messageColor.value = Colors.red;
    }

    Future.delayed(Duration(seconds: 5), () {
      message.value = '';
    });
  }

  void goToRecover(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecoverPage()),
    );
  }
}
