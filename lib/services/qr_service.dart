import 'dart:convert';
import 'package:ulimagym/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ulimagym/models/entities/AsistenciaQR.dart';
import 'package:ulimagym/models/entities/SesionQR.dart';

class QRService {
  Future<SesionQR?> obtenerQRSesionProfesor(int usuarioId) async {
    final url = Uri.parse('${BASE_URL}qr/profesor/obtener?profesor_id=$usuarioId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      print(json);
      return SesionQR.fromJson(json);
    } else {
      return null;
    }
  }
  Future<SesionQR?> registrarQRSesionProfesor(int usuarioId) async {
    final url = Uri.parse('${BASE_URL}qr/profesor/registrar?profesor_id=$usuarioId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      print(json);
      return SesionQR.fromJson(json);
    } else {
      return null;
    }
  }
  Future<AsistenciaQR?> obtenerQRAsistenciaAlumno(int sesionId, int usuarioId) async {
    final url = Uri.parse('${BASE_URL}qr/alumno?sesion_id=$sesionId&alumno_id=$usuarioId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      print(json);
      return AsistenciaQR.fromJson(json);
    } else {
      return null;
    }
  }
  
}
