import 'dart:convert';

class SesionProfe {
  final int id;
  final String fechaInicio;
  final String fechaFin;
  final int seccion_id;

  SesionProfe({
    required this.id,
    required this.fechaInicio,
    required this.fechaFin,
    required this.seccion_id,
  });

  factory SesionProfe.fromJson(Map<String, dynamic> json) {
    return SesionProfe(
      id: json['id'],
      fechaInicio: json['fechaInicio'],
      fechaFin: json['fechaFin'],
      seccion_id: json['seccion_id']
    );
  }
}
