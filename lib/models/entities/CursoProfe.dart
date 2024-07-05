import 'dart:convert';

class CursoProfe {
  final int profesorId;
  final String cursoNombre;
  final String seccionCodigo;
  final String color;
  final int seccId;

  CursoProfe({
    required this.profesorId,
    required this.cursoNombre,
    required this.seccionCodigo,
    required this.color,
    required this.seccId,
  });

  factory CursoProfe.fromJson(Map<String, dynamic> json) {
    return CursoProfe(
      profesorId: json['profesor_id'],
      cursoNombre: json['curso_nombre'],
      seccionCodigo: json['seccion_codigo'],
      color: json['color'],
      seccId: json['secc_id'],
    );
  }
}
