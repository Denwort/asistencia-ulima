import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import '../models/entities/Usuario.dart';

class RecuperarService {
  Future<void> recuperar(String usuario) async {
    final url = Uri.parse('${BASE_URL}recuperar?usuario=$usuario');
    final response = await http.get(url);

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}
