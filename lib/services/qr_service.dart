import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ulimagym/models/entities/CursoProfe.dart';
import '../models/entities/Sesion.dart';
import '../models/entities/Asistencia.dart';

class QRService {
  Future<Sesion> obtenerQRSesionProfesor(int usuarioId) async {
    final url = Uri.parse('${BASE_URL}qr/profesor?profesor_id=$usuarioId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      print(json);
      return Sesion.fromJson(json);
    } else {
      throw Exception('Failed to load sesion');
    }
  }
  Future<Asistencia> obtenerQRAsistenciaAlumno(int sesionId, int usuarioId) async {
    final url = Uri.parse('${BASE_URL}qr/alumno?sesion_id=$sesionId&alumno_id=$usuarioId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      print(json);
      return Asistencia.fromJson(json);
    } else {
      throw Exception('Failed to load asistencia');
    }
  }
  
}
