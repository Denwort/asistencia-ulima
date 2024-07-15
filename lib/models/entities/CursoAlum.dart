import 'dart:convert';

class CursoAlum {
  final int alumnoId;
  final String cursoNombre;
  final String seccionCodigo;
  final int profesorId;
  final String profesorNombres;
  final String profesorApellidos;
  final String color;
  final int seccId;

  CursoAlum({
    required this.alumnoId,
    required this.cursoNombre,
    required this.seccionCodigo,
    required this.profesorId,
    required this.profesorNombres,
    required this.profesorApellidos,
    required this.color,
    required this.seccId,
  });

  factory CursoAlum.fromJson(Map<String, dynamic> json) {
    return CursoAlum(
      alumnoId: json['alumno_id'],
      cursoNombre: json['curso_nombre'],
      seccionCodigo: json['seccion_codigo'],
      profesorId: json['profesor_id'],
      profesorNombres: json['profesor_nombres'],
      profesorApellidos: json['profesor_apellidos'],
      color: json['color'],
      seccId: json['secc_id'],
    );
  }
}
