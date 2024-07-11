import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/entities/Usuario.dart';
import '../recover/recover_page.dart';
import 'package:ulimagym/services/recuperar_service.dart';
import 'package:ulimagym/pages/home/home_page.dart';

class RecoverController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    String username = usernameController.text;

    try {
      await RecuperarService().recuperar(username);
      print('usuario correcto');
    } catch (e) {
      print('error: usuario incorrecto');
      print(e);
    }
  }
}
