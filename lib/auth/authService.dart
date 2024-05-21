import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

class AuthService {
  Future<void> saveUsuario(Usuario usuario) async {
    final prefs = await SharedPreferences.getInstance();
    String usuarioJson = jsonEncode(usuario.toJson());
    await prefs.setString('usuario', usuarioJson);
  }

  Future<Usuario?> getUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    String? usuarioJson = prefs.getString('usuario');
    if (usuarioJson != null) {
      Map<String, dynamic> usuarioMap = jsonDecode(usuarioJson);
      return Usuario.fromJson(usuarioMap);
    }
    return null;
  }

  Future<void> removeUsuario() async {
    print('BORRADO');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario');
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('usuario');
  }
}