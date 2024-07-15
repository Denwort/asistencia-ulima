import 'package:get/get.dart';

class AsistenciaProfe {
  final int id;
  final int alumnoId;
  final int sesionId;
  final String nombres;
  final String apellidos;
  RxBool asistio;

  AsistenciaProfe({
    required this.id,
    required this.alumnoId,
    required this.sesionId,
    required this.nombres,
    required this.apellidos,
    required bool asistio,
  }) : this.asistio = asistio.obs;

  factory AsistenciaProfe.fromJson(Map<String, dynamic> json) {
    return AsistenciaProfe(
      id: json['id'],
      alumnoId: json['alumno_id'],
      sesionId: json['sesion_id'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      asistio: json['asistio'],
    );
  }
}