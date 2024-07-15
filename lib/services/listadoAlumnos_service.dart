import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ulimagym/models/entities/AsistenciasProfe.dart';


class ListadoalumnosService {
  Future<List<AsistenciaProfe>> obtenerAsistenciasProfesor(int sesionId) async {
    final url = Uri.parse('${BASE_URL}profesor/asistencias?sesion_id=$sesionId');
    final response = await http.get(url);
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> asistenciasJson = jsonDecode(response.body);
      return asistenciasJson.map((json) => AsistenciaProfe.fromJson(json)).toList();
    } else {
      throw Exception('Fallo al cargar asistencias');
    }
  }

  Future<bool> modificarAsistencia(int asistenciaId, bool asistio) async {
    final url = Uri.parse('${BASE_URL}profesor/modificarAsistencia?asistencia_id=$asistenciaId&asistio=$asistio');
    final response = await http.post(url);
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load asistencia');
    }
  }
}
