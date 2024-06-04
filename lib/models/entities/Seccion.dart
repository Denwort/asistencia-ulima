import 'dart:convert';

import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/models/entities/Curso.dart';
import 'package:ulimagym/models/entities/Periodo.dart';

Seccion seccionFromJson(String str) => Seccion.fromJson(json.decode(str));

String seccionToJson(Seccion data) => json.encode(data.toJson());

class Seccion {
  int id;
  String codigo;
  Periodo periodo;
  Curso curso;
  Usuario usuario;

  Seccion({
    required this.id,
    required this.codigo,
    required this.periodo,
    required this.curso,
    required this.usuario,
  });

  Seccion.empty()
      : id = 0,
        codigo = '',
        periodo = Periodo.empty(),
        curso = Curso.empty(),
        usuario = Usuario.empty();

  factory Seccion.fromJson(Map<String, dynamic> json) => Seccion(
        id: json["id"],
        codigo: json["codigo"],
        periodo: Periodo.fromJson(json["periodo"]),
        curso: Curso.fromJson(json["curso"]),
        usuario: Usuario.fromJson(json["usuario"]),
      );

// cambie el nombre de profesor a usuario
  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "periodo": periodo.toJson(),
        "curso": curso.toJson(),
        "usuario": usuario.toJson(),
      };
  @override
  String toString() {
    return 'Seccion -> id: ${id}, codigo: ${this.codigo}, periodo: ${this.periodo}, curso: ${this.curso}, usuario: ${this.usuario}';
  }

  static List<Seccion> lista = [
    // Secciones de movil, erp y riesgos. 2 de Pepe y 1 de nina.
    Seccion(
      id: 0,
      codigo: '830',
      periodo: '2024-1',
      curso: 'Programacion movil',
      usuario: Usuario.lista[0],
    ),
    Seccion(
      id: 1,
      codigo: '833',
      periodo: '2024-1',
      curso: 'Taller de propuesta de investigacion',
      usuario: Usuario.lista[0],
    ),
    Seccion(
      id: 2,
      codigo: '831',
      periodo: '2024-1',
      curso: 'Ingenieria de software 2',
      usuario: Usuario.lista[1],
    )
  ];
}
