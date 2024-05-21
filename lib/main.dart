import 'package:flutter/material.dart';
import 'package:ulimagym/auth/authService.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/home/home_page.dart';
import './pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthService authService = AuthService();
  final Usuario? usuario = await authService.getUsuario();
  runApp(MyApp(usuario: usuario, authService: authService));
}

class MyApp extends StatelessWidget {
  final Usuario? usuario;
  final AuthService? authService;

  MyApp({required this.usuario, required this.authService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: usuario != null ? HomePage(usuarioLogged: usuario!) : LoginPage(),
    );
  }
}