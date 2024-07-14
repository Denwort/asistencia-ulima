import 'dart:convert';

class SesionAlum {
  final int sesionId;
  final String fechaInicio;
  final String fechaFin;
  final int asistio;

  SesionAlum({
    required this.sesionId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.asistio,
  });

  factory SesionAlum.fromJson(Map<String, dynamic> json) {
    return SesionAlum(
      sesionId: json['sesion_id'],
      fechaInicio: json['fechaInicio'],
      fechaFin: json['fechaFin'],
      asistio: json['asistio'],
    );
  }
}
