import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ulimagym/configs/constants.dart';
import 'package:ulimagym/models/entities/SesionAlum.dart';


class AsistenciasAlumnoService {
  Future<List<SesionAlum>> obtenerSesionesPorAlumno(int usuarioId, int seccionId) async {
    final url = Uri.parse('${BASE_URL}alumno/sesiones?usuario_id=$usuarioId&seccion_id=$seccionId');
    final response = await http.get(url);    
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    
    if (response.statusCode == 200) {
      final List<dynamic> sesionesJson = jsonDecode(response.body);
      return sesionesJson.map((json) => SesionAlum.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sessions');
    }
  }
}
