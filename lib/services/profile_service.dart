import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/configs/constants.dart';

class ProfileService {
  Future<Usuario> obtenerPerfil(int usuarioId) async {
    final url = Uri.parse('${BASE_URL}usuario/perfil?usuario_id=$usuarioId');
    final response = await http.get(url);

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> perfilJson = jsonDecode(response.body);
      return Usuario.fromJson(perfilJson);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
