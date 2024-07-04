import 'dart:convert';

class Curso2 {
  final int alumnoId;
  final String cursoNombre;
  final String seccionCodigo;
  final int profesorId;
  final String profesorNombres;
  final String profesorApellidos;
  final String color;
  final int seccId;

  Curso2({
    required this.alumnoId,
    required this.cursoNombre,
    required this.seccionCodigo,
    required this.profesorId,
    required this.profesorNombres,
    required this.profesorApellidos,
    required this.color,
    required this.seccId,
  });

  factory Curso2.fromJson(Map<String, dynamic> json) {
    return Curso2(
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
