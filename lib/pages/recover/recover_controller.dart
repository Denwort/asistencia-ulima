import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverController extends GetxController {
  TextEditingController dniController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString message = 'primer mensaje'.obs;
  var messageColor = Colors.white.obs;

  void resetPassword() {
    print('falta resetPassword');
  }
}
