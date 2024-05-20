import 'dart:convert';

import 'package:ulimagym/models/entities/Usuario.dart';

Seccion seccionFromJson(String str) => Seccion.fromJson(json.decode(str));

String seccionToJson(Seccion data) => json.encode(data.toJson());

class Seccion {
  int id;
  String codigo;
  String periodo;
  String curso;
  Usuario profesor;

  Seccion.empty()
      : id = 0,
        codigo = '',
        periodo = '',
        curso = '',
        profesor = Usuario.empty();

  Seccion({
    required this.id,
    required this.codigo,
    required this.periodo,
    required this.curso,
    required this.profesor,
  });

  factory Seccion.fromJson(Map<String, dynamic> json) => Seccion(
        id: json["id"],
        codigo: json["codigo"],
        periodo: json["periodo"],
        curso: json["curso"],
        profesor: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "periodo": periodo,
        "curso": curso,
        "profesor": profesor.toJson(),
      };
  @override
  String toString() {
    return 'Seccion -> id: ${id}, codigo: ${this.codigo}, periodo: ${this.periodo}, curso: ${this.curso}, profesor: ${this.profesor}';
  }

  static List<Seccion> lista = [
    // Secciones de movil, erp y riesgos. 2 de Pepe y 1 de nina.
    Seccion(
      id: 0,
      codigo: '830',
      periodo: '2024-1',
      curso: 'Programacion movil',
      profesor: Usuario.lista[0],
    ),
    Seccion(
      id: 1,
      codigo: '833',
      periodo: '2024-1',
      curso: 'Taller de propuesta de investigacion',
      profesor: Usuario.lista[0],
    ),
    Seccion(
      id: 2,
      codigo: '831',
      periodo: '2024-1',
      curso: 'Ingenieria de software 2',
      profesor: Usuario.lista[1],
    )
  ];
}
