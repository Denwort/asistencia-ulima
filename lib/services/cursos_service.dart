import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import '../models/entities/Curso2.dart'; // Asegúrate de importar Curso2

class CursoService {
  Future<List<Curso2>> obtenerCursosPorAlumno(int usuarioId) async {
    final url = Uri.parse('${BASE_URL}curso/alumno?usuario_id=$usuarioId');
    final response = await http.get(url);
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> cursosJson = jsonDecode(response.body);
      return cursosJson.map((json) => Curso2.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
