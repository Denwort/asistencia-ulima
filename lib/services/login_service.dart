import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import '../models/entities/Usuario.dart'; 

class LoginService {
  Future<Usuario> login(String usuario, String contrasenia) async {
    final url = Uri.parse('${BASE_URL}login?usuario=$usuario&contrasenia=$contrasenia');

    final response = await http.get(url);
    
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Usuario.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to login');
    }
  }
}
