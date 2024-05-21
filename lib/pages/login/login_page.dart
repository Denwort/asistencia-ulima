import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import './login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController control = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Evita que la vista se redimensione cuando el teclado está abierto
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Stack(
      children: [
        _imageBackground(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: _form(context, isKeyboardOpen),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _form(BuildContext context, bool isKeyboardOpen) {
    return Container(
      padding: EdgeInsets.all(24.0),
      margin: EdgeInsets.fromLTRB(0.0, 0.0 , 0.0 , isKeyboardOpen ? 200.0 : 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            'Bienvenido',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF26F29),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Usuario',
              prefixIcon: Icon(Icons.person),
            ),
            controller: control.userController,
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Contraseña',
              prefixIcon: Icon(Icons.lock),
            ),
            controller: control.passController,
            obscureText: true,
          ),
          SizedBox(height: 16),
          Obx(()=>Text(
            control.message.value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: control.messageColor.value,
            ),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              control.login(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF26F29),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Ingresar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              control.goToRecover(context);
            },
            child: Text(
              'Recuperar Contraseña',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF26F29),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
