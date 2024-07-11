import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recover_controller.dart';

class RecoverPage extends StatelessWidget {
  final RecoverController control = Get.put(RecoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Stack(
      children: [
        _imageBackground(),
        Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: _form(context, isKeyboardOpen),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _form(BuildContext context, bool isKeyboardOpen) {
    return Container(
      padding: EdgeInsets.all(24.0),
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, isKeyboardOpen ? 200.0 : 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(
            'Olvidó su Contraseña?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF26F29),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: 'Usuario',
              labelStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            controller: control.usernameController,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                control.resetPassword(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF26F29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                padding: EdgeInsets.zero,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ingresar',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF26F29),
              ),
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
          image: AssetImage('assets/images/recuperar.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}