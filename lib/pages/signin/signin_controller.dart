import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  TextEditingController dniController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  RxString message = 'primer mensaje'.obs;
  var messageColor = Colors.white.obs;
  RxBool termsCheck = false.obs;
  RxString markdownData = ''.obs;

  void createAccount() {
    print('falta createAccount');
  }

  Future<void> getTerms() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/mukeshsolanki/MarkdownView-Android/main/README.md'));
    markdownData.value = response.body;
  }

  void aceptTerms(BuildContext context) {
    print("aceptTerms");
    this.termsCheck.value = true;
    Navigator.pop(context);
  }

  void declineTerms(BuildContext context) {
    print("decline");
    this.termsCheck.value = false;
    Navigator.pop(context);
  }
}
