import 'dart:convert';

import 'package:ulimagym/models/entities/Carrera.dart';
import 'package:ulimagym/models/entities/Nivel.dart';
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
  Usuario profesor;

  Seccion({
    required this.id,
    required this.codigo,
    required this.periodo,
    required this.curso,
    required this.profesor,
  });

  Seccion.empty()
      : id = 0,
        codigo = '',
        periodo = Periodo.empty(),
        curso = Curso.empty(),
        profesor = Usuario.empty();

  factory Seccion.fromJson(Map<String, dynamic> json) => Seccion(
        id: json["id"],
        codigo: json["codigo"],
        periodo: Periodo.fromJson(json["periodo"]),
        curso: Curso.fromJson(json["curso"]),
        profesor: Usuario.fromJson(json["profesor"]),
      );

// cambie el nombre de profesor a usuario
  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "periodo": periodo.toJson(),
        "curso": curso.toJson(),
        "profesor": profesor.toJson(),
      };
  @override
  String toString() {
    return 'Seccion -> id: ${id}, codigo: ${this.codigo}, periodo: ${this.periodo}, curso: ${this.curso}, prfeosro: ${this.profesor}';
  }

  static List<Seccion> lista = [
    // Secciones de movil, erp y riesgos. 2 de Pepe y 1 de nina.
    Seccion(
      id: 0,
      codigo: '830',
      periodo: Periodo( // Asegúrate de crear el constructor adecuado para Periodo
        id: 1,
        nombre: '2024-1',
      ),
      curso: Curso( // Asegúrate de crear el constructor adecuado para Curso
        id: 1,
        nombre: 'Programacion movil',
        color: 'blue',
        carreraId : Carrera(id: 1, nombre: "Ingeniería de sistemas"),
        nivelId: Nivel(id:8, nombre:"8"),
      ),
      profesor: Usuario.lista[0],
    ),
    Seccion(
      id: 1,
      codigo: '833',
      periodo: Periodo( // Asegúrate de crear el constructor adecuado para Periodo
        id: 1,
        nombre: '2024-1',
      ),
      curso: Curso( // Asegúrate de crear el constructor adecuado para Curso
        id: 2,
        nombre: 'Taller de propuesta de investigacion',
        color: 'red',
        carreraId : Carrera(id: 1, nombre: "Ingeniería de sistemas"),
        nivelId: Nivel(id:8, nombre:"8"),
      ),
      profesor: Usuario.lista[0],
    ),
    Seccion(
      id: 2,
      codigo: '831',
      periodo: Periodo( // Asegúrate de crear el constructor adecuado para Periodo
        id: 1,
        nombre: '2024-1',
      ),
      curso: Curso( // Asegúrate de crear el constructor adecuado para Curso
        id: 2,
        nombre: 'Ingeniería de software 2',
        color: 'green',
        carreraId : Carrera(id: 1, nombre: "Ingeniería de sistemas"),
        nivelId: Nivel(id:8, nombre:"8"),
      ),
      profesor: Usuario.lista[1],
    )
  ];
}
