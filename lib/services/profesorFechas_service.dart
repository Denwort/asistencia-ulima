import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ulimagym/models/entities/SesionProfe.dart';


class ProfesorFechasService {
  Future<List<SesionProfe>> obtenerSesionesProfesor(int seccionId) async {
    final url = Uri.parse('${BASE_URL}profesor/sesiones?seccion_id=$seccionId');
    final response = await http.get(url);
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> sesionesJson = jsonDecode(response.body);
      return sesionesJson.map((json) => SesionProfe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sesions');
    }
  }
}
